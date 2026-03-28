`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2026 04:55:25 PM
// Design Name: 
// Module Name: register_file
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


module register_file(
input clk,we,
input[2:0] waddr,raddr1,raddr2,
input [15:0]wdata,
output[15:0]rdata1,rdata2
    );
    
    reg [15:0] regs [7:0];
    always @(posedge clk) begin
    if (we == 1'b1)
        regs[waddr] <= wdata;
    end

initial begin
    regs[0] = 16'h0003; // useful for zero and negative tests
    regs[1] = 16'h0005; // extra normal value
    regs[2] = 16'h0000;
    regs[3] = 16'h0000;
    regs[4] = 16'h7FFF; // for signed overflow test
    regs[5] = 16'h0001; // for carry/overflow increment
    regs[6] = 16'hFFFF; // for carry test
    regs[7] = 16'h0000;
end
    
    
    assign rdata1 = regs[raddr1];
    assign rdata2 = regs[raddr2];
    
endmodule
