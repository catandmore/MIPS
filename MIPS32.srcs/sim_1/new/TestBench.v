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
    reg i_reset;
    reg i_clk;
    reg i_ce; 
    reg i_re1;
    reg `RegAddrWide i_ReadReg1;
    wire `DataBus o_ReadData1;
    reg i_re2;
    reg `RegAddrWide i_ReadReg2;
    wire `DataBus o_ReadData2;
    reg i_we;
    reg `RegAddrWide i_WriteReg;
    reg `DataBus i_WriteData;    
    
    Regiters Regiters0(
        i_reset, 
        i_clk, i_ce, 
        i_re1, 
        i_ReadReg1, 
        o_ReadData1, 
        i_re2, 
        i_ReadReg2, 
        o_ReadData2, 
        i_we, 
        i_WriteReg, 
        i_WriteData);
        
    initial 
    begin
        i_reset = `ResetEnable;
        #1 i_reset = ~i_reset;
        i_re1 = `ReadEnable;
        i_re2 = `ReadEnable;        
        i_ce = `ChipEnable;
        i_we = `WriteEnable;
        i_clk = 0;
        #10 i_clk = ~i_clk;
        #10 i_clk = ~i_clk;
        #10 i_clk = ~i_clk;
    end
    
    initial
    begin
        i_ReadReg1 = 1;
        i_ReadReg2 = 9;
        i_WriteReg = 29;
        
        i_WriteData = 29;
    end

endmodule
