`timescale 1ns / 1ps
`include "Define.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/04 21:51:15
// Design Name: 
// Module Name: ROM
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


module ROM(
    input `AddrBus pc,
    input ce,
    output `InstrBus Instr
    );
    reg `AddrBus _pc;
    reg _ce;
    reg `InstrBus _Instr;
    assign Instr = _Instr;
    always @ pc
    begin
        _pc = pc;
    end
    always @ ce
    begin
        _ce = ce;
    end
    //必要的初始化
    initial
    begin
        _pc = `NonAddr;
        _ce = `ChipEnable;
        _Instr = `NonInstr;
    end
    
    //定义ROM
    reg `MemElem rom `MemSize;
    //ROM初始化
    integer i;
    initial begin
        i=0;
        while(i<=65535)
        begin
            rom[i] = i % (8'b111111);
            i=i+1;
        end
    end

    
    always @ (_pc)
    begin
        if(_ce === `ChipDisable)
        begin
            _Instr <= `NonInstr;
        end
        
        else
        begin
            _Instr[31:24] <= rom[_pc];
            _Instr[23:16] <= rom[_pc+1];
            _Instr[15:8] <= rom[_pc+2];
            _Instr[7:0] <= rom[_pc+3];
             
        end
        
    end
    
    
endmodule
