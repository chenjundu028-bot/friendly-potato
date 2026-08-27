// =====================================================================
// counter - 参数化计数器
// ---------------------------------------------------------------------
// 每个时钟上升沿, 若 enable 为高则加 1。
// 位宽由参数 WIDTH 控制, 复位为低有效 (rst_n)。
// =====================================================================

`timescale 1ns/1ps

module counter #(
    parameter integer WIDTH = 8
)(
    input  wire             clk,
    input  wire             rst_n,
    input  wire             enable,
    output reg [WIDTH-1:0]  q
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)      q <= {WIDTH{1'b0}};
        else if (enable) q <= q + 1'b1;
    end

endmodule
