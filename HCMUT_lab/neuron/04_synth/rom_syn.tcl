set_db library /opt/PDKs/skywater130/timing/sky130_fd_sc_hd__ff_100C_1v95.lib
read_hdl -sv /home/admin/shared/neuron/02_rtl/rom.sv
elaborate /home/admin/shared/neuron/02_rtl/rom.sv

write_hdl > rom_net.vs
check_design

set clock [define_clock -period 2500 -name clock1 [clock_ports]]

external_delay -input 0 -clock $clock /designs/*/ports_in/*

external_delay -output 0 -clock $clock /designs/*/ports_out/*

syn_generic
syn_map
syn_opt

report timing > rom_timing.rpt

report area > rom_area.rpt
write_hdl > rom_net.vg
