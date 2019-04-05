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
    wire `InstrBus Instr;
    
    Instr_Fetch Instr_Fetch0(clk, reset, Instr);
    
    initial 
    begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    initial 
    begin
        reset = `ResetDisable;
        forever #150 reset = ~reset;
    end

endmodule
