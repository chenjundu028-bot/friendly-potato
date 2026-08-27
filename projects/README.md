# FPGA 工程

这里放**完整**的 FPGA 工程（Vivado `.xpr` 工程、Quartus `.qpf` / `.qsf` 工程等）。

## 注意

- **只提交工程配置文件，不要提交工具生成的中间产物**。
  - Vivado：`*.runs/`、`*.cache/`、`*.sim/`、`*.gen/`、`*.hw/` 等生成目录已由根目录 `.gitignore` 忽略。
  - Quartus：`db/`、`incremental_db/` 等生成目录已忽略。
- 每个工程建议配一个 `README.md`：说明用的什么开发板、什么工具版本、如何打开、预期功能。

## 建议结构

```
projects/
  └── <工程名>/
      ├── README.md      # 工程说明
      ├── <工程>.xpr     # (Vivado) 或 <工程>.qpf/.qsf (Quartus)
      └── ...
```

> 若工程在别的电脑打开，需要重新指定源码路径；把实际用到的 RTL 仍放到 [`../rtl/`](../rtl/)，约束放 [`../constraints/`](../constraints/) 更易复用。
