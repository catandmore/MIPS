`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/04 22:34:32
// Design Name: 
// Module Name: Instr_Fetch
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


module Instr_Fetch(
    input clk,
    input reset,
    output `InstrBus Instr
    );
    wire `AddrBus pc;
    wire ce;
    
    PC_reg PC_reg0(clk, reset, pc, ce);
    ROM ROM0(pc ,ce, Instr);
    
endmodule
