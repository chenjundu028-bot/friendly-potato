# RTL 源码

这里存放可复用 / 通用的 Verilog 与 SystemVerilog 源码头。

## 约定

- 一个模块一个文件，文件名用**小写下划线**，如 `led_blink.v`。
- 与模块同名的仿真测试放在 [`../sim/`](../sim/)，命名 `tb_<模块名>.v`。
- 通用可复用模块放本目录，具体工程相关的模块优先放在对应工程目录内。

## 示例

| 文件 | 说明 |
| --- | --- |
| [`example/blink.v`](example/blink.v) | LED 闪烁，入门即可运行 |
| [`example/counter.v`](example/counter.v) | 参数化计数器 |
