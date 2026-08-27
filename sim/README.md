# 仿真

存放 testbench 与仿真脚本。

## 约定

- testbench 命名 `tb_<模块名>.v`，与被测模块同名。
- 默认用 `$dumpfile` / `$dumpvars` 导出 `.vcd` 波形，方便用 GTKWave 查看。
- 顶步用 `` `timescale 1ns/1ps `` 明确时间单位。

## 运行示例（Icarus Verilog）

```bash
iverilog -g2012 -o sim.vvp sim/tb_blink.v rtl/example/blink.v
vvp sim.vvp
gtkwave tb_blink.vcd
```

提交前建议用 `iverilog` 快速编译跑一次，确保队友能直接运行。
