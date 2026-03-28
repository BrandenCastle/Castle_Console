`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/24/2026 05:14:27 PM
// Design Name:
// Module Name: GPU_top
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

module GPU_top(
    input PixelClk,
    input SerialClk,
    input rst,
    output TMDS_Clk_p,
    output TMDS_Clk_n,
    output [2:0] TMDS_Data_n,
    output [2:0] TMDS_Data_p
);

    wire vid_on, hsync, vsync;
    wire [9:0] x, y;
    wire [3:0] R, G, B;
    wire [23:0] vid_pData;

    assign vid_pData[23:16] = {R, R};
    assign vid_pData[15:8]  = {G, G};
    assign vid_pData[7:0]   = {B, B};

    timing_gen timegen (
        .clk(PixelClk),
        .rst(rst),
        .x(x),
        .y(y),
        .vid_on(vid_on),
        .hsync(hsync),
        .vsync(vsync)
    );

    pixel_gen pix (
        .clk(PixelClk),
        .x(x),
        .y(y),
        .vid_on(vid_on),
        .R(R),
        .G(G),
        .B(B)
    );

    // Configure rgb2dvi_0 for:
    // - external SerialClk input
    // - active HIGH reset (aRst)
    rgb2dvi_0 rgb2dvi (
        .aRst(rst),
        .vid_pData(vid_pData),
        .vid_pHSync(hsync),
        .vid_pVSync(vsync),
        .vid_pVDE(vid_on),
        .PixelClk(PixelClk),
        .SerialClk(SerialClk),
        .TMDS_Clk_p(TMDS_Clk_p),
        .TMDS_Clk_n(TMDS_Clk_n),
        .TMDS_Data_p(TMDS_Data_p),
        .TMDS_Data_n(TMDS_Data_n)
    );

endmodule