`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2026 09:10:00 AM
// Design Name: 
// Module Name: CC_PC
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


module CC_PC(
input clk,rst,pc_en,branch_taken,
input[3:0] branch_target,
output reg[3:0] pc
    );
  
  always @ (posedge clk or posedge rst)begin
  if(rst)
    pc <= 0;
  
    else if (branch_taken)
        pc <= branch_target;//do something 
        else if (pc_en)
            pc <= pc+1;

    end

endmodule
