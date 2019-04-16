`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/16 23:04:27
// Design Name: 
// Module Name: Instr_Decode
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


module Instr_Decode(
    input clk,
    input reset,
    input `InstrBus instr,
    output  `DataBus operand1,
    output  `DataBus operand2,
    output  [2:0] op_type,
    output  [7:0] sub_op_type
    );
    wire read_reg_ce1;
    wire read_reg_ce2;
    wire write_reg_ce;
    wire `RegBus read_reg_addr1;
    wire `RegBus read_reg_addr2;
    wire `RegBus write_reg_addr;
    wire `DataBus read_reg_data1;
    wire `DataBus read_reg_data2;
    Decoder Decoder0(reset, clk,
                     instr,read_reg_data1, read_reg_data2,
                     read_reg_ce1, read_reg_ce2, write_reg_ce,
                     read_reg_addr1, read_reg_addr2, write_reg_addr,
                     op_type, sub_op_type, operand1, operand2);
    Regiters Regiters0(reset,
                       read_reg_ce1, read_reg_addr1, read_reg_data1,
                       read_reg_ce2, read_reg_addr2, read_reg_data2,
                       write_reg_ce, write_reg_addr);
endmodule
