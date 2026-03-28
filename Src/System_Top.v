`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/27/2026 09:46:49 AM
// Design Name:
// Module Name: System_Top
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module System_Top(
    input clk,
    input rst,
    output TMDS_Clk_p,
    output TMDS_Clk_n,
    output [2:0] TMDS_Data_p,
    output [2:0] TMDS_Data_n
);

    wire PixelClk;
    wire SerialClk;
    wire locked;

    // Hold downstream logic in reset until clock wizard locks
    wire sys_rst = rst | ~locked;

    // Configure clk_wiz_0 for:
    // - input clk = 100 MHz
    // - output Pixelclk = 25 MHz
    // - output SerialClk = 125 MHz
    // - active LOW reset input (resetn)
    clk_wiz_0 clkwiz (
        .clk_in1(clk),
        .resetn(~rst),
        .locked(locked),
        .Pixelclk(PixelClk),
        .SerialClk(SerialClk)
    );

    GPU_top gpu (
        .PixelClk(PixelClk),
        .SerialClk(SerialClk),
        .rst(sys_rst),
        .TMDS_Clk_p(TMDS_Clk_p),
        .TMDS_Clk_n(TMDS_Clk_n),
        .TMDS_Data_p(TMDS_Data_p),
        .TMDS_Data_n(TMDS_Data_n)
    );

endmodule