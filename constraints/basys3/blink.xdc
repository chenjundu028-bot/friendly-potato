# =====================================================================
# blink.xdc - Digilent Basys3 (xc7a35tcsg324-1) 的 blink_top 引脚约束
# 引脚值取自 Digilent 官方 Basys-3-Master.xdc
# =====================================================================

# 100MHz 系统时钟 (板上振荡器)
set_property -dict { PACKAGE_PIN W5 IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

# 中央按键 (高有效) -> 顶层 btnC
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports btnC]

# LED0 -> 顶层 led
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports led]
