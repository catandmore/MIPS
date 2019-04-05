`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/04 20:35:27
// Design Name: 
// Module Name: PC_reg
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


module PC_reg(
    input clk,
    input reset,
    output `AddrBus PC,
    output CE
    );
    
    //寄存器定义
    reg `AddrBus _PC;
    reg _CE;
    reg _reset;
    assign PC = _PC;
    assign CE = _CE;
    always @ reset
    begin
        _reset = reset;
    end
    //必要的初始化
    initial
    begin
        _PC = 0;
    end
    //时序逻辑
    always @ (posedge clk)
    begin
        if(_reset === `ResetEnable)
        begin
            _PC <= `NonAddr;
            _CE <= `ChipDisable;    
        end
        
        else
        begin
            _CE <= `ChipEnable;  
            _PC <= _PC + 4;
        end
    end
    
endmodule
