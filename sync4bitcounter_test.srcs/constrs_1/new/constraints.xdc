# LEDs on AC701 main board
set_property PACKAGE_PIN M26 [get_ports q_a]
set_property IOSTANDARD LVCMOS33 [get_ports q_a]

set_property PACKAGE_PIN T24 [get_ports q_b]
set_property IOSTANDARD LVCMOS33 [get_ports q_b]

set_property PACKAGE_PIN T25 [get_ports q_c]
set_property IOSTANDARD LVCMOS33 [get_ports q_c]

set_property PACKAGE_PIN R26 [get_ports q_d]
set_property IOSTANDARD LVCMOS33 [get_ports q_d]

# Pushbuttons
set_property PACKAGE_PIN P6 [get_ports aclr]
set_property IOSTANDARD LVCMOS15 [get_ports aclr]

set_property PACKAGE_PIN R5 [get_ports aload]
set_property IOSTANDARD SSTL15 [get_ports aload]

set_property PACKAGE_PIN U6 [get_ports sclr]
set_property IOSTANDARD SSTL15 [get_ports sclr]

set_property PACKAGE_PIN U5 [get_ports sload]
set_property IOSTANDARD SSTL15 [get_ports sload]

set_property PACKAGE_PIN T5 [get_ports not_ent]
set_property IOSTANDARD SSTL15 [get_ports not_ent]


# DIP switches
set_property PACKAGE_PIN R8 [get_ports a]
set_property IOSTANDARD SSTL15 [get_ports a]

set_property PACKAGE_PIN P8 [get_ports b]
set_property IOSTANDARD SSTL15 [get_ports b]

set_property PACKAGE_PIN R7 [get_ports c]
set_property IOSTANDARD SSTL15 [get_ports c]

set_property PACKAGE_PIN R6 [get_ports d]
set_property IOSTANDARD SSTL15 [get_ports d]

# System clock 200 MHz
set_property PACKAGE_PIN R3 [get_ports clk]
set_property IOSTANDARD LVDS_25 [get_ports clk]

set_property PACKAGE_PIN P3 [get_ports clk_n]
set_property IOSTANDARD LVDS_25 [get_ports clk_n]

# LEDs on external board
set_property PACKAGE_PIN F25 [get_ports rco]
set_property IOSTANDARD LVCMOS25 [get_ports rco]

set_property PACKAGE_PIN G25 [get_ports cco]
set_property IOSTANDARD LVCMOS25 [get_ports cco]

set_property PACKAGE_PIN G26 [get_ports clk_out]
set_property IOSTANDARD LVCMOS25 [get_ports clk_out]