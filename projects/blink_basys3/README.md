# blink_basys3 — 示例工程

一个开箱即用的 **Vivado 工程模板**，演示如何把仓库里的通用 RTL 模块接成能上板的工程。

## 功能

- 板上 **LED0** 以约 **1 秒**为周期闪烁。
- 按住**中央按键**可保持 LED 熄灭（低有效复位），松开恢复闪烁。
- 时钟为板上 100MHz 振荡器（`W5`）。

## 你需要的环境

- Vivado（建议 **2021.x** 或更新版本）。
- 一块 **Digilent Basys 3**（Artix-7，`xc7a35tcsg324-1`）开发板，已经通过 USB 接好。
- 若用其他板卡，需替换 `../constraints/basys3/` 下的引脚约束和 `create_project.tcl` 中的 `part` / `board_part`（见下文「换板卡」）。

## 如何生成工程

1. 打开 Vivado。
2. 在左下角 **Tcl Console** 中执行：

   ```tcl
   cd <仓库路径>/projects/blink_basys3
   source create_project.tcl
   ```

3. 工程会自动创建并打开：`blink_basys3.xpr`。

## 如何上板运行

1. 工程打开后，点左侧 **Generate Bitstream**（或取消 `create_project.tcl` 末尾 `launch_runs` 注释放着自动生成）。
2. 完成后点 **Open Hardware Manager** → **Open Target** → 连接板卡 → **Program Device**，选择生成的 `.bit` 文件。
3. 观察 LED0 闪烁。

## 目录里有什么

| 文件 | 作用 |
| --- | --- |
| `blink_top.v` | 板级顶层：把 `rtl/example/blink.v` 接到时钟 / 按键 / LED |
| `create_project.tcl` | 一键生成 `.xpr` 工程的脚本 |
| `../../constraints/basys3/blink.xdc` | 引脚约束（W5 / U18 / U16） |
| `../../rtl/example/blink.v` | 通用 LED 闪烁模块 |

## 想改闪烁速度？

把 `blink_top.v` 里的 `TOGGLE_COUNT(50_000_000)` 改小（更快）或改大（更慢）。例如改成 `10_000_000` 则约 5 秒一个完整周期。

## 换板卡

- 把 `create_project.tcl` 的 `set part` 和 `set board_part` 改成你的板卡。
  - 常用：Arty A7-100T 用 `xc7a100tcsg324-1` / `digilentinc.com:arty-a7-100t:part0:1.1`。
  - 可以到 Vivado 的 `Board Files` 里查你板卡的精确值。
- 新建你的 `constraints/<板卡名>/xxx.xdc`，填入真实引脚（参考 Digilent 官方 Master XDC）。
