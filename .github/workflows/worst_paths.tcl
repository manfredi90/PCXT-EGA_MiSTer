project_open PCXT-EGA -revision PCXT-EGA
create_timing_netlist -model slow
read_sdc
update_timing_netlist
set cpu {emu|pll|pll_inst|altera_pll_i|cyclonev_pll|counter[0].output_counter|divclk}
set vb  {emu|pll_system_inst|pll_system_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}
report_timing -setup -to_clock [get_clocks $cpu] -npaths 15 -detail summary -file worst_paths.txt
report_timing -setup -to_clock [get_clocks $vb] -npaths 15 -detail summary -file worst_paths.txt -append
report_clock_transfers -setup -file worst_paths.txt -append
delete_timing_netlist
project_close
