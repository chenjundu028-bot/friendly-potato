// =====================================================================
// blink - 简单的 LED 闪烁模块
// ---------------------------------------------------------------------
// 参数 TOGGLE_COUNT: LED 翻转一次需要计数的时钟周期数。
//   时钟 100MHz 时, 若想 LED 每 0.5s 翻转一次, 则 TOGGLE_COUNT ≈ 50MHz。
//   仿真时可把 TOGGLE_COUNT 设小(如 4), 便于快速看到翻转。
// 复位为低有效 (rst_n)。
// =====================================================================

`timescale 1ns/1ps

module blink #(
    parameter integer TOGGLE_COUNT = 25_000_000   // 每翻转一次需计数的时钟周期
)(
    input  wire clk,
    input  wire rst_n,
    output reg  led
);

    // 计数到 TOGGLE_COUNT-1 后翻转 led, 避免计数器溢出
    localparam integer WIDTH = $clog2(TOGGLE_COUNT);
    reg [WIDTH-1:0] counter;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= {WIDTH{1'b0}};
            led     <= 1'b0;
        end else if (counter >= (TOGGLE_COUNT - 1)) begin
            counter <= {WIDTH{1'b0}};
            led     <= ~led;
        end else begin
            counter <= counter + 1'b1;
        end
    end

endmodule
