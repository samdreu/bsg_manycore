# This file contains a list of the *core* manycore architecture files that are
# used in simulation. This has NOT been used in tapeout or any tapeout related
# activities beyond simulation

VINCLUDES += $(BASEJUMP_STL_DIR)/bsg_misc
VINCLUDES += $(BASEJUMP_STL_DIR)/bsg_cache
VINCLUDES += $(BASEJUMP_STL_DIR)/bsg_noc
VINCLUDES += $(BASEJUMP_STL_DIR)/bsg_tag
VINCLUDES += $(BSG_MANYCORE_DIR)/v
VINCLUDES += $(BSG_MANYCORE_DIR)/v/vanilla_bean
VINCLUDES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source
VINCLUDES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/RISCV

VHEADERS += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_defines.sv
VHEADERS += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_noc_pkg.sv
VHEADERS += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_torus_router_pkg.sv
VHEADERS += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_mesh_router_pkg.sv
VHEADERS += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_wormhole_router_pkg.sv
VHEADERS += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_noc_links.svh
VHEADERS += $(BASEJUMP_STL_DIR)/bsg_tag/bsg_tag_pkg.sv
VHEADERS += $(BASEJUMP_STL_DIR)/bsg_cache/bsg_cache_pkg.sv
VHEADERS += $(BASEJUMP_STL_DIR)/bsg_cache/bsg_cache_non_blocking_pkg.sv
VHEADERS += $(BASEJUMP_STL_DIR)/bsg_fpu/bsg_fpu_defines.svh
VHEADERS += $(BSG_MANYCORE_DIR)/v/bsg_manycore_pkg.sv
VHEADERS += $(BSG_MANYCORE_DIR)/v/vanilla_bean/bsg_vanilla_pkg.sv
VHEADERS += $(BSG_MANYCORE_DIR)/v/bsg_manycore_addr_pkg.sv
VHEADERS += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/bsg_hardfloat_pkg.sv

VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_less_than.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_reduce.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_transpose_reduce.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_alloc_wavefront.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_alloc_wavefront_cell.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_abs.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_mul_synth.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_priority_encode.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_priority_encode_one_hot_out.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_encode_one_hot.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_scan.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_mux.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_mux_one_hot.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_mux_segmented.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_mux_bitwise.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_dff.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_dff_chain.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_dff_en_bypass.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_dff_reset_en_bypass.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_dff_en.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_dff_reset.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_dff_reset_en.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_dff_reset_set_clear.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_transpose.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_crossbar_o_by_i.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_decode_with_v.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_decode.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_counter_clear_up.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_counter_up_down.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_counter_set_down.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_round_robin_arb.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_arb_round_robin.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_circular_ptr.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_imul_iterative.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_idiv_iterative.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_idiv_iterative_controller.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_inv.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_buf.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_buf_ctrl.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_xnor.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_nor2.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_adder_cin.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_expand_bitmask.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_lru_pseudo_tree_decode.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_lru_pseudo_tree_encode.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_lru_pseudo_tree_backup.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_thermometer_count.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_id_pool.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_concentrate_static.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_array_concentrate_static.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_unconcentrate_static.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_mux2_gatestack.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_counting_leading_zeros.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_mul_add_unsigned.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_misc/bsg_hashing_ipoly.sv


VHEADERS += $(BASEJUMP_STL_DIR)/bsg_tag/bsg_tag_client.sv

VSOURCES += $(BASEJUMP_STL_DIR)/bsg_dataflow/bsg_fifo_1r1w_large.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_dataflow/bsg_fifo_1rw_large.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_dataflow/bsg_fifo_1r1w_small.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_dataflow/bsg_fifo_1r1w_small_unhardened.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_dataflow/bsg_two_fifo.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_dataflow/bsg_round_robin_n_to_1.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_dataflow/bsg_round_robin_2_to_2.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_dataflow/bsg_parallel_in_serial_out.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_dataflow/bsg_serial_in_parallel_out.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_dataflow/bsg_fifo_tracker.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_dataflow/bsg_make_2D_array.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_dataflow/bsg_flatten_2D_array.sv

VSOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_1r1w.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_1r1w_synth.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_1r1w_sync.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_1r1w_sync_synth.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_1rw_sync.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_1rw_sync_synth.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_2r1w_sync.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_2r1w_sync_synth.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_3r1w_sync.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_3r1w_sync_synth.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_1rw_sync_mask_write_byte.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_1rw_sync_mask_write_byte_synth.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_1rw_sync_mask_write_bit.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_1rw_sync_mask_write_bit_synth.sv

VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_mesh_stitch.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_mesh_router.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_mesh_router_decoder_dor.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_mesh_router_buffered.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_wormhole_router.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_wormhole_router_decoder_dor.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_wormhole_router_input_control.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_wormhole_router_output_control.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_wormhole_concentrator.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_wormhole_concentrator_in.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_wormhole_concentrator_out.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_barrier.sv

VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_torus_router.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_torus_router_vc.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_torus_router_xbar.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_torus_router_alloc.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_noc/bsg_torus_router_decode.sv


VSOURCES += $(BASEJUMP_STL_DIR)/bsg_async/bsg_launch_sync_sync.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_async/bsg_sync_sync.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_async/bsg_async_fifo.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_async/bsg_async_ptr_gray.sv

VSOURCES += $(BASEJUMP_STL_DIR)/bsg_cache/bsg_cache.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_cache/bsg_cache_decode.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_cache/bsg_cache_dma.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_cache/bsg_cache_dma_to_wormhole.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_cache/bsg_cache_miss.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_cache/bsg_cache_sbuf.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_cache/bsg_cache_tbuf.sv
VSOURCES += $(BASEJUMP_STL_DIR)/bsg_cache/bsg_cache_buffer_queue.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_link_to_cache.sv


VSOURCES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/fNToRecFN.v
VSOURCES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/compareRecFN.v
VSOURCES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/divSqrtRecFN.v
VSOURCES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/divSqrtRecFN_medium.v
VSOURCES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/divSqrtRecFN_small.v
VSOURCES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/iNToRecFN.v
VSOURCES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/mulAddRecFN.v
VSOURCES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/recFNToFN.v
VSOURCES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/HardFloat_rawFN.v
VSOURCES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/HardFloat_primitives.v
VSOURCES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/isSigNaNRecFN.v
VSOURCES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/recFNToIN.v
VSOURCES += $(BSG_MANYCORE_DIR)/imports/HardFloat/source/RISCV/HardFloat_specialize.v


VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/bsg_manycore_proc_vanilla.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/network_rx.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/network_tx.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/vanilla_core.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/alu.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/cl_decode.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/fpu_float.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/fpu_float_fma.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/fpu_float_fma_round.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/fpu_float_aux.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/fpu_int.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/fpu_int_fclass.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/fcsr.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/mcsr.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/fpu_fdiv_fsqrt.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/fpu_fmin_fmax.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/icache.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/idiv.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/load_packer.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/lsu.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/regfile.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/regfile_synth.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/regfile_hard.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/vanilla_bean/scoreboard.sv

VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_tile_compute_torus.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_tile_vcache_torus.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_torus_node.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_pod_torus.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_pod_ruche_array.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_pod_ruche.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_pod_ruche_row.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_pod_mesh_array.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_pod_mesh.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_pod_mesh_row.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_tile_compute_array_ruche.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_tile_compute_ruche.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_tile_compute_array_mesh.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_tile_compute_mesh.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_tile_compute_full_ruche.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_tile_vcache_full_ruche.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_pod_full_ruche.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_tile_vcache_array.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_tile_vcache.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_hetero_socket.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_mesh_node.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_endpoint.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_endpoint_fc.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_endpoint_standard.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_reg_id_decode.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_eva_to_npa.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_dram_hash_function.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_link_sif_tieoff.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_manycore_ruche_x_link_sif_tieoff.sv
VSOURCES += $(BSG_MANYCORE_DIR)/v/bsg_ruche_buffer.sv

VSOURCES += $(BSG_MANYCORE_DIR)/testbenches/common/v/tile_fwd_trace.sv
VSOURCES += $(BSG_MANYCORE_DIR)/testbenches/common/v/vc_fwd_trace.sv
VSOURCES += $(BSG_MANYCORE_DIR)/testbenches/common/v/vc_rev_trace.sv
VSOURCES += $(BSG_MANYCORE_DIR)/testbenches/common/v/tile_rev_trace.sv
VSOURCES += $(BSG_MANYCORE_DIR)/testbenches/common/v/torus_router_profiler.sv
