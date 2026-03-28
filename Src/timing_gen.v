`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2026 09:28:24 AM
// Design Name: 
// Module Name: timing_gen
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


module timing_gen(
input clk,rst,
output reg [9:0]x,y,
output reg hsync,vsync,
output reg vid_on
    );
    
   localparam H_visible = 640, H_front = 16, H_sync = 96, H_back = 48;
   localparam H_total = H_front+H_back+H_sync+H_visible;
   localparam V_front = 10,V_sync = 2,V_back = 33,V_visible = 480;
   localparam V_total = V_front+V_back+V_sync+V_visible;
    
    
    always @(posedge clk)begin
        
        if (rst)begin
            x <= 0;
            y <= 0;
        end
            else if (x < H_total-1)begin
                x<= x+1;
              end
              else if (x ==H_total-1)begin
                 if (y < V_total-1)begin
                 y<=y+1;
                 x<=0;
              end
                 else begin
                  x <=0; 
                  y<=0;  
                  end
              end
              
       end
       
       
       always @(*) begin
        
            vid_on =0;
            hsync = 1;
            vsync = 1;
        
        if (x<H_visible && y<V_visible)
            vid_on =1;
           else
            vid_on =0;;  
            
        if (x>=H_visible+H_front && x<H_visible + H_front+H_sync)
            hsync = 0;
                else 
                    hsync = 1;
 
        if (y>=V_visible+V_front && y<V_visible + V_front+V_sync)
            vsync = 0;
                else 
                    vsync = 1;                    
       end
endmodule
