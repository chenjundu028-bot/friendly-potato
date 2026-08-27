# friendly-potato 🥔

一个由 `chenjundu028-bot` 与两位好朋友共同维护的**杂货铺式**代码仓库。

这里不强求项目规模，主要放三样东西：

1. **Verilog / SystemVerilog 源码** —— 学习和练习的数字电路代码
2. **FPGA 工程** —— Vivado / Quartus 等工具搭建的完整工程
3. **新奇小玩意** —— 各种脑洞、实验性脚本、玩具项目

> ☕ 目标：**想放什么就放什么**，但保持基本的秩序，让大家都能一眼看懂、随时接手。

## 目录导览

| 目录 | 作用 |
| --- | --- |
| [`rtl/`](rtl/) | RTL 源码头（Verilog / SystemVerilog 模块与例化） |
| [`sim/`](sim/) | 仿真 testbench 与测试环境 |
| [`constraints/`](constraints/) | FPGA 约束文件（XDC / SDC / 引脚分配） |
| [`projects/`](projects/) | Vivado / Quartus 等完整工程 |
| [`hobby/`](hobby/) | 新奇小玩意与实验代码（每人一个子目录） |
| [`docs/`](docs/) | 协作与规范文档 |
| [`scripts/`](scripts/) | 辅助脚本 |

## 快速开始

```bash
# 克隆仓库
git clone <repo-url>
cd friendly-potato
```

放代码很简单：Verilog 源文件放进 `rtl/`，同名 `tb_*.v` 仿真放进 `sim/`，完整工程放 `projects/`，脑洞作品放 `hobby/<你的名字>/`。

## 协作约定

- 我们是一个小团队，直接在主分支（`main`）上协作。
- **不要互相覆盖**：属于自己的实验性内容放在 `hobby/<你的名字>/` 下。
- 每个模块尽量带一个测试（testbench），方便别人跑通。
- 提交信息用「动词开头的英文短句」，例如：`add: blink demo`。

详见 [CONTRIBUTING.md](docs/CONTRIBUTING.md)。

## 许可证

本仓库代码采用 [CC0 1.0 Universal](LICENSE) —— 你可以自由使用、修改、转发，无需署名。
