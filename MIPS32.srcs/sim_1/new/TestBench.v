`timescale 1ns / 1ps
`include "TestDefine.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/04 20:56:11
// Design Name: 
// Module Name: test_bench
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


module test_bench( );
    reg clk;
    reg reset;
    reg `InstrBus instr;
    wire  `DataBus operand1;
    wire  `DataBus operand2;
    wire  [2:0] op_type;
    wire  [7:0] sub_op_type;
    
    initial
    begin
        instr = 32'b00110100000000001010101010101010;
        clk = 0;
        reset = `ResetDisable;
        #10 clk = ~clk;
        #10 clk = ~clk;
    end
    
    
    
    Instr_Decode Instr_Decode0(
        clk,
        reset,
        instr,
        operand1,
        operand2,
        op_type,
        sub_op_type
        );
endmodule
