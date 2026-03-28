`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2026 04:39:01 PM
// Design Name: 
// Module Name: pixel_gen
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


module pixel_gen(
input vid_on,clk,
input [9:0] x,y,
output reg [3:0] R,G,B
    );
    reg [9:0] pos = 0;
    reg [23:0] count = 0;
    reg dir = 0;
    always @(*)begin
    R = 0;
    G = 0;
    B = 0;
    
    if (vid_on)begin
        if (x>=pos && x<pos+300)
            if (y>=100 && y<200)
                R = 15;    
        end
    end
   
    always @(posedge clk)begin
        case (dir)
            1'b0:begin
            if (pos <339 && count<24'h0FFFFF)
                count <=count+1;
              else if (pos <339 && count == 24'h0FFFFF)begin
                pos<=pos+1;
                count <=0;
                end
              else begin
                dir <=1;  
                count <=0;
                end
                end
            1'b1:begin
          if (pos >=1 && count<24'h0FFFFF)
                count <=count+1;
              else if(pos >=1 && count == 24'h0FFFFF)begin
                pos<=pos-1;
                count<=0;
                end
              else begin
                dir <=0;
                count <=0;
                end
           end
         endcase
    end
endmodule
