`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CastleCorp Technologies
// Engineer: Branden Castle
// 
// Create Date: 03/17/2026 10:00:55 AM
// Design Name: 
// Module Name: CC_ALU
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


module CC_ALU(
input[15:0] a,b,//inputs
input[3:0] alu_op,//selector
output reg[15:0] r,//result
output reg z,n,c,o //zero, negative, carry, overflow
    );
    
    reg [16:0] temp;
    always @(*) begin //combinational logic for selector
    temp = 0;
    r = 0;
    case (alu_op)//goes through all operations
    4'b0000: temp = a + b;//add
    4'b0001: temp = a - b;//subtract
    4'b0010: temp = a & b;//AND
    4'b0011: temp = a | b;//OR
    4'b0100: temp = a ^ b;//XOR
    4'b0101: temp = ~a;//NOT a
    4'b0110: temp = ~b;//NOT b
    4'b0111: temp = a << 1;//Left shift a
    4'b1000: temp = a >> 1;//right shift a
    4'b1001: temp = a;//pass a
    4'b1010: temp = b;//pass b
    default: temp = 0;//default case
    endcase 
  
    r = temp[15:0];//takes in 16 bits from result
  
    z = 0;
    n = 0; //all flags initialized at 0
    c = 0;
    o = 0;
    
       
   if (r == 0)
    z = 1'b1;
    else
    z = 1'b0;
    
    n = r[15];
    
    if (alu_op == 4'b0000 && a[15]==b[15] && r[15] != a[15])
    o = 1'b1;
    
    else if(alu_op == 4'b0001 && a[15] !=b[15] && r[15] != a[15])
    o = 1'b1;
    
    else
    o = 1'b0;
    
    if (alu_op == 4'b0000 && temp[16] == 1)
        c = 1'b1;
      else if (alu_op == 4'b0001)
        c = temp[16];
        else
        c = 1'b0;
    
    end
endmodule
