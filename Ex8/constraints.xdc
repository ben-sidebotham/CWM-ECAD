##############################################
# Part         - xcvu9p
# Package      - fsgd2104
# Speed grade  - -2L
# Xilinx Reference Board is VCU1525
###############################################################################

# General configuration - Do not modify
set_property CFGBVS GND                                [current_design]
set_property CONFIG_VOLTAGE 1.8                        [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true           [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN {DIV-1} [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES       [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4           [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES        [current_design]

#############################################################################################################

set property PACKAGE_PIN AY38 [get_ports clk_n]
set property IOSTANDARD DIFF_SSTL12 [get_ports clk_n]
set property PACKAGE_PIN AY37 [get_ports clk_p]
set property IOSTANDARD DIFF_SSTL12 [get_ports clk_p]

create_clock -period 10 -name myclk [get_ports clk_p]
set_clock_groups -asynchronous -group [get_clocks myclk -include_generated_clocks]

set property IOSTANDARD LVCMOS18 [get_ports rst_n]
set property PACKAGE_PIN BD21 [get_ports rst_n]
set property PULLUP true [get_ports rst_n]

set property IOSTANDARD LVCMOS18 [get_ports heating]
set property PACKAGE_PIN AU22 [get_ports heating]
set property IOSTANDARD LVCMOS18 [get_ports cooling]
set property PACKAGE_PIN AT22 [get_ports cooling]
set property IOSTANDARD LVCMOS18 [get_ports temperature_0]
set property PACKAGE_PIN BC21 [get_ports temperature_0]
set property IOSTANDARD LVCMOS18 [get_ports temperature_1]
set property PACKAGE_PIN BB21 [get_ports temperature_1]
set property IOSTANDARD LVCMOS18 [get_ports temperature_2]
set property PACKAGE_PIN BA20 [get_ports temperature_2]
set property IOSTANDARD LVCMOS18 [get_ports temperature_3]
set property PACKAGE_PIN AL20 [get_ports temperature_3]
set property IOSTANDARD LVCMOS18 [get_ports temperature_4]
set property PACKAGE_PIN AT20 [get_ports temperature_4]
