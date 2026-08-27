// =====================================================================
// blink_top - Basys3 顶层: 把 blink 模块接到板上时钟 / 按键 / LED
// ---------------------------------------------------------------------
//  - clk : 板上 100MHz 振荡器 (W5)
//  - btnC: 中央按键 (U18), 反相后作为低有效复位 rst_n
//  - led : LED0 (U16), 以约 1 秒周期闪烁
// =====================================================================

`timescale 1ns/1ps

module blink_top (
    input  wire clk,     // 100 MHz, 来自板上振荡器 W5
    input  wire btnC,    // 中央按键, 低有效复位源
    output wire led      // LED0
);

    // 按键为高有效, 反相后作为低有效复位:
    //   按下 = 复位(LED 灭), 松开 = 正常运行
    wire rst_n = ~btnC;

    // 100MHz 下每 50M 周期翻转一次 => 0.5s 翻转, 完整闪烁周期 1s
    blink #(.TOGGLE_COUNT(50_000_000)) u_blink (
        .clk   (clk),
        .rst_n (rst_n),
        .led   (led)
    );

endmodule
