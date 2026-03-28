`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2026 04:35:20 PM
// Design Name: 
// Module Name: CPU_top
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


module CPU_top(
    input clk,rst,
    output[15:0]r,//essential inputs/outputs
    output z,n,c,o
    );
    
    wire[15:0] rdata1,rdata2,instr;
    wire we, pc_en,branch_taken;
    wire [3:0] alu_op,pc,branch_target;
    wire [2:0] waddr, raddr1, raddr2;
    
    assign alu_op = instr[12:9];
    assign waddr = instr[8:6];
    assign raddr1 = instr[5:3];
    assign raddr2 = instr [2:0];
    assign branch_target = instr[3:0];
    
    //instantiate ALU
    CC_ALU ALU(.a(rdata1),
    .b(rdata2),.alu_op(alu_op),
    .r(r),.z(z),.n(n),
    .c(c),.o(o));//instantiate ALU
    
    //instantiate register file
    register_file RegFile(.wdata(r),
    .waddr(waddr),
    .raddr1(raddr1),//instantiate register
    .raddr2(raddr2),
    .rdata1(rdata1),
    .rdata2(rdata2),
    .we(we),
    .clk(clk));
    
    //instantiate FSM
    CC_FSM FSM(.branch_taken(branch_taken),
    .we(we),
    .z(z),
    .n(n),
    .o(o),
    .c(c),
    .clk(clk),
    .rst(rst),
    .alu_op(alu_op),
    .pc_en(pc_en));
    
    //instantiate PC
    CC_PC PC(.branch_taken(branch_taken),
    .clk(clk),.rst(rst),
    .pc(pc),
    .pc_en(pc_en),
    .branch_target(branch_target));
    
    
    //instantiate memory
    instruction_mem Instructions(.instr(instr),.addr(pc));
endmodule
