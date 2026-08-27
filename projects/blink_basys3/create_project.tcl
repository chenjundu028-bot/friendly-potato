# =====================================================================
# create_project.tcl - 由源码一键生成 Vivado 工程 (blink_basys3)
# ---------------------------------------------------------------------
# 使用方法:
#   1. 打开 Vivado (建议 2021.x 或更新)
#   2. 左下角 Tcl Console 中执行:
#        cd <仓库>/projects/blink_basys3
#        source create_project.tcl
#   3. 工程会自动生成并打开: blink_basys3 / blink_basys3.xpr
# =====================================================================

# 当前脚本所在的工程目录 与 仓库根目录
set proj_dir [file normalize [file dirname [info script]]]
set root_dir [file normalize [file dirname [file dirname [file dirname [info script]]]]]

# --- 目标器件 / 板卡: Digilent Basys3 (Artix-7) ---
set part       xc7a35tcsg324-1
set board_part digilentinc.com:basys3:part0:1.1

# --- 清理旧的同名工程(可选,避免重复创建报错) ---
if {[file exists [file join $proj_dir "blink_basys3"]]} {
    file delete -force [file join $proj_dir "blink_basys3"]
}

# --- 创建工程 ---
cd $proj_dir
create_project blink_basys3 $proj_dir -part $part
set_property board_part $board_part [current_project]

# --- 加入 RTL 源码 ---
add_files -norecurse [file join $root_dir "rtl/example/blink.v"]
add_files -norecurse [file join $proj_dir "blink_top.v"]
set_property top blink_top [current_fileset]

# --- 加入约束 ---
add_files -fileset constrs_1 -norecurse [file join $root_dir "constraints/basys3/blink.xdc"]

# --- 更新编译顺序 ---
update_compile_order -fileset sources_1

# 如需创建时直接生成比特流, 取消下面一行注释:
# launch_runs impl_1 -to_step write_bitstream

puts "工程已生成: $proj_dir/blink_basys3.xpr"
