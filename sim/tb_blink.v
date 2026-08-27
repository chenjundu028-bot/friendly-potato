// =====================================================================
// tb_blink - blink 模块的仿真测试
// ---------------------------------------------------------------------
// 把 TOGGLE_COUNT 设为 4, 使 LED 在每 4 个时钟周期翻转一次, 便于观察。
// 仿真结束会输出 tb_blink.vcd 波形, 可用 GTKWave 打开。
// 运行方式(需安装 Icarus Verilog):
//   iverilog -g2012 -o sim.vvp sim/tb_blink.v rtl/example/blink.v
//   vvp sim.vvp
//   gtkwave tb_blink.vcd
// =====================================================================

`timescale 1ns/1ps

module tb_blink;
    reg  clk   = 1'b0;
    reg  rst_n = 1'b0;
    wire led;

    blink #(.TOGGLE_COUNT(4)) dut (
        .clk   (clk),
        .rst_n (rst_n),
        .led   (led)
    );

    // 10ns 周期 => 100MHz 时钟
    always #5 clk = ~clk;

    integer toggles = 0;
    reg     prev_led = 1'b0;

    initial begin
        $dumpfile("tb_blink.vcd");
        $dumpvars(0, tb_blink);

        rst_n = 1'b0;
        #20 rst_n = 1'b1;

        // 观察 LED 翻转次数
        @(posedge clk);
        forever begin
            @(posedge clk);
            if (led != prev_led) begin
                toggles = toggles + 1;
                prev_led = led;
            end
        end
    end

    // 仿真一段时间后结束并报告
    initial begin
        #500;
        $display("LED 翻转次数: %0d", toggles);
        $finish;
    end

endmodule
