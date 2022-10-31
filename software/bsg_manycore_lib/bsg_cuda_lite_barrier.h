#ifndef BSG_CUDA_LITE_BARRIER_H
#define BSG_CUDA_LITE_BARRIER_H
#include "bsg_barrier_amoadd.h"
#include "bsg_hw_barrier.h"
#include "bsg_tile_config_vars.h"

#if defined(BSG_BARRIER_HW_TILE_GROUP_USE_BSG_TILE_GROUP_BARRIER)
#include "bsg_tile_group_barrier.hpp"
#endif

#ifdef __cplusplus
extern "C" {
#endif

extern int *__cuda_barrier_cfg;

#if defined(BSG_BARRIER_HW_TILE_GROUP_USE_BSG_TILE_GROUP_BARRIER)
    __attribute__((weak))
    bsg_barrier<bsg_tiles_X, bsg_tiles_Y> __cuda_tg_barrier;
/**
 * Initialize the tile-group barrier.
 * This function should only be called once for the lifetime of the tile-group.
 */
static inline void bsg_barrier_hw_tile_group_init()
{
    int sense = 1;
    __cuda_tg_barrier.reset();        
    bsg_barrier_amoadd(&__cuda_barrier_cfg[0], &sense);
}

/**
 * Invoke the tile-group barrier.
 */
static inline void bsg_barrier_hw_tile_group_sync()
{
    __cuda_tg_barrier.sync();
}

#elif defined(BSG_BARRIER_HW_TILE_GROUP_USE_BSG_BARRIER_AMOADD)
__attribute__((weak))
int __cuda_amoadd_barrier_sense = 1;

__attribute__((weak,section(".dram")))
int __cuda_amoadd_barrier_var = 0;
/**
 * Initialize the tile-group barrier.
 * This function should only be called once for the lifetime of the tile-group.
 */    
static inline void bsg_barrier_hw_tile_group_init()
{
}
/**
 ** Invoke the tile-group barrier.
 */
static inline void bsg_barrier_hw_tile_group_sync()
{
    bsg_barrier_amoadd(&__cuda_amoadd_barrier_var,
                       &__cuda_amoadd_barrier_sense);
}
    
#else
/**
 * Initialize the tile-group barrier.
 * This function should only be called once for the lifetime of the tile-group.
 */
static inline void bsg_barrier_hw_tile_group_init()
{
    int sense = 1;
    // initalize csr
    int cfg = __cuda_barrier_cfg[1+__bsg_id];
    asm volatile ("csrrw x0, 0xfc1, %0" : : "r" (cfg));
    // reset Pi
    asm volatile ("csrrwi x0, 0xfc2, 0");
    // sync with amoadd barrier
    bsg_barrier_amoadd(&__cuda_barrier_cfg[0], &sense);
}

/**
 * Invoke the tile-group barrier.
 */
static inline void bsg_barrier_hw_tile_group_sync()
{
    bsg_barsend();
    bsg_barrecv();
}
#endif
#ifdef __cplusplus
}
#endif
#endif
