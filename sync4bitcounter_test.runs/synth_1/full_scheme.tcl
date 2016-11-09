# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a200tfbg676-2
set_property target_language VHDL [current_project]
set_property board_part xilinx.com:ac701:part0:1.0 [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/Rufus/VivadoProjects/sync4bitcounter_test/sync4bitcounter_test.srcs/sources_1/new/tri_state_buffer.vhd
  C:/Users/Rufus/VivadoProjects/sync4bitcounter_test/sync4bitcounter_test.srcs/sources_1/new/scheme_7.vhd
  C:/Users/Rufus/VivadoProjects/sync4bitcounter_test/sync4bitcounter_test.srcs/sources_1/new/scheme_6.vhd
  C:/Users/Rufus/VivadoProjects/sync4bitcounter_test/sync4bitcounter_test.srcs/sources_1/new/scheme_5.vhd
  C:/Users/Rufus/VivadoProjects/sync4bitcounter_test/sync4bitcounter_test.srcs/sources_1/new/scheme_4.vhd
  C:/Users/Rufus/VivadoProjects/sync4bitcounter_test/sync4bitcounter_test.srcs/sources_1/new/scheme_3.vhd
  C:/Users/Rufus/VivadoProjects/sync4bitcounter_test/sync4bitcounter_test.srcs/sources_1/new/scheme_2.vhd
  C:/Users/Rufus/VivadoProjects/sync4bitcounter_test/sync4bitcounter_test.srcs/sources_1/new/scheme_1.vhd
  C:/Users/Rufus/VivadoProjects/sync4bitcounter_test/sync4bitcounter_test.srcs/sources_1/new/JK_trigger.vhd
  C:/Users/Rufus/VivadoProjects/sync4bitcounter_test/sync4bitcounter_test.srcs/sources_1/new/full_scheme.vhd
}
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Rufus/VivadoProjects/sync4bitcounter_test/sync4bitcounter_test.cache/wt [current_project]
set_property parent.project_dir C:/Users/Rufus/VivadoProjects/sync4bitcounter_test [current_project]
catch { write_hwdef -file full_scheme.hwdef }
synth_design -top full_scheme -part xc7a200tfbg676-2
write_checkpoint full_scheme.dcp
report_utilization -file full_scheme_utilization_synth.rpt -pb full_scheme_utilization_synth.pb
