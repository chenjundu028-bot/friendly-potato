# 协作规范

本仓库由三位朋友共同维护。规则不多，但希望大家遵守，保持仓库干净、可交接。

## 1. 目录约定

- **`rtl/`**：可复用 / 通用 Verilog 模块。
- **`sim/`**：testbench 与仿真脚本，命名 `tb_<模块名>.v`。
- **`constraints/`**：引脚与时序约束（`.xdc` / `.sdc`）。
- **`projects/`**：完整 FPGA 工程（Vivado / Quartus）。
- **`hobby/<你的名字>/`**：自己的实验内容，**不要覆盖别人的目录**。
- **`docs/`**：文档；**`scripts/`**：辅助脚本。

## 2. 命名

- 文件名：小写下划线，如 `pwm_generator.v`。
- 模块名：小写下划线，与文件名一致。
- 参数：大写下划线，如 `CLK_FREQ`。
- 信号：`clk`、`rst_n`（低有效复位）、`enable` 等简洁命名。

## 3. Git 提交

- 提交信息用**动词开头**的英文短句：`add:` `fix:` `update:` `refactor:`。
  - 示例：`add: blink demo`、`fix: led toggle counter overflow`。
- 一次提交只做一件事，方便回溯。
- 在 `main` 分支直接提交；如需冒险改动，可先开分支再合并。

## 4. 测试

- 每个模块尽量带一个 `tb_*.v`，让队友能直接跑通。
- 提交前用 `iverilog` 快速编译跑一次（见 `sim/README.md`）。

## 5. 许可证

仓库采用 [CC0 1.0 Universal](../LICENSE)，自由使用，无署名要求。
