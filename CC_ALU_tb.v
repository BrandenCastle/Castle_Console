`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2026 03:16:06 PM
// Design Name: 
// Module Name: CC_ALU_tb
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


module CC_ALU_tb;

    reg  [15:0] a, b;
    reg  [3:0]  alu_op;
    wire [15:0] r;
    wire z, n, c, o;

    // Instantiate the ALU
    CC_ALU uut (
        .a(a),
        .b(b),
        .alu_op(alu_op),
        .r(r),
        .z(z),
        .n(n),
        .c(c),
        .o(o)
    );

    initial begin
        // Optional waveform dump if your simulator supports it
        // $dumpfile("CC_ALU_tb.vcd");
        // $dumpvars(0, CC_ALU_tb);

        $display(" time   alu_op      a       b       r    z n c o");
        $display("--------------------------------------------------");
        $monitor("%4t   %b   %h   %h   %h   %b %b %b %b",
                 $time, alu_op, a, b, r, z, n, c, o);

        // Test 1: ADD normal
        a = 16'h0002; b = 16'h0003; alu_op = 4'b0000;
        #10;

        // Test 2: ADD zero + carry
        a = 16'hFFFF; b = 16'h0001; alu_op = 4'b0000;
        #10;

        // Test 3: ADD overflow
        a = 16'h7FFF; b = 16'h0001; alu_op = 4'b0000;
        #10;

        // Test 4: SUB zero
        a = 16'h0003; b = 16'h0003; alu_op = 4'b0001;
        #10;

        // Test 5: SUB negative
        a = 16'h0001; b = 16'h0002; alu_op = 4'b0001;
        #10;

        // Test 6: AND
        a = 16'h00F0; b = 16'h0FF0; alu_op = 4'b0010;
        #10;

        // Test 7: OR
        a = 16'h00F0; b = 16'h0F0F; alu_op = 4'b0011;
        #10;

        // Test 8: XOR
        a = 16'hAAAA; b = 16'h5555; alu_op = 4'b0100;
        #10;

        // Test 9: NOT A
        a = 16'h0000; b = 16'h1234; alu_op = 4'b0101;
        #10;

        // Test 10: NOT B
        a = 16'h1234; b = 16'h0000; alu_op = 4'b0110;
        #10;

        // Test 11: SHIFT LEFT
        a = 16'h0001; b = 16'h0000; alu_op = 4'b0111;
        #10;

        // Test 12: SHIFT RIGHT
        a = 16'h8000; b = 16'h0000; alu_op = 4'b1000;
        #10;

        // Test 13: PASS A
        a = 16'h1234; b = 16'hFFFF; alu_op = 4'b1001;
        #10;

        // Test 14: PASS B
        a = 16'h1234; b = 16'hABCD; alu_op = 4'b1010;
        #10;

        $finish;
    end

endmodule
