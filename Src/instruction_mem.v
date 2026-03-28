`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2026 02:44:27 PM
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem(
input [3:0] addr,
output [15:0] instr
    );
    
    reg [15:0] mem [0:15];
    assign instr = mem[addr];
initial begin
    mem[0]  = 16'h0900; // XOR R2, R0, R0  -> 0000, Z=1
    mem[1]  = 16'h1604; // BZ 4            -> branch taken (because Z=1)

    mem[2]  = 16'h0049; // ADD R1, R1, R1  -> should be skipped
    mem[3]  = 16'h01FF; // ADD R7, R7, R7  -> should be skipped

    mem[4]  = 16'h0AC0; // NOT R3, R0      -> FFFC, N=1
    mem[5]  = 16'h01F5; // ADD R7, R6, R5  -> 0000, C=1, Z=1
    mem[6]  = 16'h0065; // ADD R1, R4, R5  -> 8000, O=1, N=1

    mem[7]  = 16'h1609; // BZ 9            -> branch NOT taken (because Z=0)
    mem[8]  = 16'h12C0; // PASS A R3, R0   -> 0003, proves not-taken branch fell through
    mem[9]  = 16'h0E40; // SHL R1, R0      -> 0006

    mem[10] = 16'h0000;
    mem[11] = 16'h0000;
    mem[12] = 16'h0000;
    mem[13] = 16'h0000;
    mem[14] = 16'h0000;
    mem[15] = 16'h0000;
end
endmodule
