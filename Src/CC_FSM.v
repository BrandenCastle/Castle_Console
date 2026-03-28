`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2026 11:03:10 AM
// Design Name: 
// Module Name: CC_FSM
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


module CC_FSM(
input clk,rst,z,n,c,o,
input [3:0] alu_op,
output reg we,pc_en, branch_taken
    );
    
    reg [1:0] state, next_state;
    
    always @(*) begin
    case(state)
    2'b00: next_state = 2'b01; //switch to execute`1
    2'b01: next_state = 2'b10; //switch to write
    2'b10: next_state = 2'b00;  //return to fetch
    default: next_state = 2'b00; 
    
    endcase
    end
    
    always @(posedge clk or posedge rst) begin
    if (rst)
        state <= 2'b00;
        else
        state <= next_state;
    end
  
    always @(*) begin
    we = 0;//initialize variables
    pc_en = 0;
    branch_taken = 0;
    case(state)
    2'b00: begin //fetch
    we = 0;
    end
    2'b01:begin
     we = 0;//execute
     end
    2'b10: begin //write
       if (alu_op <= 4'b1010)begin
       we = 1;
       pc_en = 1;
      end 
       else if (alu_op == 4'b1011 && z)begin//BZ case. makes pc jump to chosen address
            branch_taken = 1;
            end
    else if (alu_op == 4'b1011 && !z) begin
        pc_en = 1;
    end
        
    end
    endcase
    
    end
    
endmodule
