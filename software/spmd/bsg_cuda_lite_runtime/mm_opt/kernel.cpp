//====================================================================
// addmml kernel
// 03/09/2020 Kexin Zheng, Lin Cheng (kz73@cornell.edu, lc873@cornell.edu)
//====================================================================

#define BLOCK_DIM 8 // sqrt(4KB/4 byte/4 data matrix) = 15 max
#include <kernel_common.hpp>
#include <kernel_mm_opt.hpp>

extern "C" __attribute__ ((noinline))  
int kernel_mm_opt(
                  hb_tensor_t* _result,
                  hb_tensor_t* _mat1,
                  hb_tensor_t* _mat2) {

        auto mat1 = HBTensor<float, 2>(_mat1);
        auto mat2 = HBTensor<float, 2>(_mat2);
        auto result = HBTensor<float, 2>(_result);

        // Start profiling
        bsg_cuda_print_stat_kernel_start();


        // v2: single tile, use blocking
        int r1 = mat1.dim(0);
        int c1 = mat1.dim(1);
        int r2 = mat2.dim(0);
        int c2 = mat2.dim(1);
        //hb_assert(c1 == r2);

        // calculate number of row and col blocks in each matrix
        int m1_num_blk_per_row = (r1 + BLOCK_DIM - 1) / BLOCK_DIM; // how many blocks in m1 per row
        int m1_num_blk_per_col = (c1 + BLOCK_DIM - 1) / BLOCK_DIM; // how many blocks in m1 per col
        int m2_num_blk_per_row = (r2 + BLOCK_DIM - 1) / BLOCK_DIM; // how many blocks in m2 per row
        int m2_num_blk_per_col = (c2 + BLOCK_DIM - 1) / BLOCK_DIM; // how many blocks in m2 per col

        // calculate dimensions of the last row and col block in each matrix
        int m1_last_blk_dim_x = c1 % BLOCK_DIM == 0 ? BLOCK_DIM : c1 % BLOCK_DIM; // x dimension of last block of mat1
        int m1_last_blk_dim_y = r1 % BLOCK_DIM == 0 ? BLOCK_DIM : r1 % BLOCK_DIM; // y dimension of last block of mat1
        int m2_last_blk_dim_x = c2 % BLOCK_DIM == 0 ? BLOCK_DIM : c2 % BLOCK_DIM; // x dimension of last block of mat2
        int m2_last_blk_dim_y = r2 % BLOCK_DIM == 0 ? BLOCK_DIM : r2 % BLOCK_DIM; // y dimension of last block of mat2

        float sp_mat1[BLOCK_DIM * BLOCK_DIM];
        float sp_mat2[BLOCK_DIM * BLOCK_DIM];
        float sp_result[BLOCK_DIM * BLOCK_DIM];

        for (int i = 0; i < m1_num_blk_per_row; i += BSG_TILE_GROUP_Y_DIM) {
                for (int j = 0; j < m2_num_blk_per_col; j += BSG_TILE_GROUP_X_DIM) {
                        int rr = i + __bsg_y;
                        int rc = j + __bsg_x;
                        int res_dim_y = rr == m1_num_blk_per_row - 1 ? m1_last_blk_dim_y : BLOCK_DIM;
                        int res_dim_x = rc == m2_num_blk_per_col - 1 ? m2_last_blk_dim_x : BLOCK_DIM;

                        // Initialize the scratchpad for this particular sub-block
                        // Unroll by a factor of 16 to minimize control overhead
                        bsg_unroll(16)
                        for (int sp = 0; sp < BLOCK_DIM * BLOCK_DIM; sp += 1) {
                                sp_result[sp] = 0;
                        }

                        // process mat1 and mat2 for this result block
                        // only care about blocks of mat1 in row rr
                        // and blocks of mat2 in col rc
                        for (int mat1x = 0, mat2y = 0; mat1x < m1_num_blk_per_col && mat2y < m2_num_blk_per_row; mat1x++, mat2y++) {
                                // calculate current block dimensions
                                int mid_dim = mat1x == m1_num_blk_per_col - 1 ? m1_last_blk_dim_x : BLOCK_DIM;

                                load_block<BLOCK_DIM, BLOCK_DIM>(sp_mat1, mat1, rr, mat1x);
                                load_block<BLOCK_DIM, BLOCK_DIM>(sp_mat2, mat2, mat2y, rc);
                                accum_block<BLOCK_DIM, BLOCK_DIM/2, BLOCK_DIM, BLOCK_DIM/2>(sp_result, sp_mat1, sp_mat2);
                        }

                        // copy this block back into DRAM
                        for (int i = 0; i < BLOCK_DIM; i++) {
                                for (int j = 0; j < BLOCK_DIM; j++) {
                                        // unrolled version
                                        result(rr * BLOCK_DIM + i, rc * BLOCK_DIM + j) = sp_result[i * res_dim_x + j];
                                        // end: unrolled version
                                }
                        }
                }
        }
        //   End profiling
        bsg_cuda_print_stat_kernel_end();

        g_barrier.sync();
        return 0;
}

template<unsigned int BX, unsigned int BY>
int kernel_mm_opt(
                  hb_tensor_t* _result,
                  hb_tensor_t* _mat1,
                  hb_tensor_t* _mat2) {

        auto mat1 = HBTensor<float, 2>(_mat1);
        auto mat2 = HBTensor<float, 2>(_mat2);
        auto result = HBTensor<float, 2>(_result);

        // Start profiling
        bsg_cuda_print_stat_kernel_start();

        int r1 = mat1.dim(0);
        int c1 = mat1.dim(1);
        int r2 = mat2.dim(0);
        int c2 = mat2.dim(1);
        //hb_assert(c1 == r2);

        // TODO: Assertions if block dimensions are non-sensical W.R.T
        // input dimensions (should be divisible)

        // BX is the X-dimension of the sub-block
        // BY is the Y-dimension of the sub-block
        // _mat1 is a r1 x c1 matrix
        // _mat2 is a r2 x c2 matrix
        // c1 == r2
        // c1 % BX == 0, r2 % BX == 0
        // c2 % BY == 0, r1 % BY == 0

        // Compute the number of blocks, the loop bound of the
        // inner-loop.
        int blocks = c1 / BX; // r2 / BX

        // Local Storage Blocks
        float block_row[BY * BX];
        float block_col[BX * BY];

        float psum[BY * BX];

        // Iterate through available output blocks in the X and Y
        // dimensions. Jump by the tile group size between iterations
        // to assign unique work.
        // Yes, this should be TGID
        for (int by_i = __bsg_y; by_i < r1/BY; by_i += BSG_TILE_GROUP_Y_DIM) {
                for (int bx_i = __bsg_x; bx_i < c2/BX; by_i += BSG_TILE_GROUP_X_DIM) {

                        // Initialize the scratchpad for this particular sub-block
                        // Unroll by a factor of 16 to minimize control overhead
                        bsg_unroll(16)
                        for (int i = 0; i < BY * BX; ++i){
                               psum[i] = 0;
                        }

                        // Multiply the blocks, and accumulate into the result
                        for (int bz_i = 0; bz_i < blocks; bz_i++) {
                                load_block<BY, BX>(block_row, mat1, by_i, bz_i);
                                load_block<BY, BX>(block_col, mat2, bz_i, bx_i);
                                accum_block<BY, BY/2, BX, BX/2>(psum, block_row, block_col);
                        }

                        // Copy this block back into DRAM
                        for (int sby_i = 0; sby_i < BY; ++sby_i) {
                                for (int sbx_i = 0; sbx_i < BX; ++sbx_i) {
                                       result(by_i * BY + sby_i, bx_i * BX + sbx_i) = psum[sby_i * BX + sbx_i];
                                }
                        }
                }
        }
        //   End profiling
        bsg_cuda_print_stat_kernel_end();

        g_barrier.sync();
        return 0;
}

int kernel_mm_opt_8x8(
                  hb_tensor_t* _result,
                  hb_tensor_t* _mat1,
                  hb_tensor_t* _mat2) {
        return kernel_mm_opt<8,8>(_result, _mat1, _mat2);
}
