`timescale 1ns / 1ps
`include "Define.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/05 15:41:19
// Design Name: 
// Module Name: Regiters
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


module Regiters(
    input reset,
    input clk,
    input ce,
    
    input re1,
    input `RegAddrWide ReadReg1,
    output `DataBus ReadData1,
    
    input re2,
    input `RegAddrWide ReadReg2,
    output `DataBus ReadData2,
    
    input we,
    input `RegAddrWide WriteReg,
    input `DataBus WriteData    
    );
    reg i_reset;
    reg i_clk;
    reg i_ce; 
    reg i_re1;
    reg `RegAddrWide i_ReadReg1;
    reg `DataBus o_ReadData1;
    reg i_re2;
    reg `RegAddrWide i_ReadReg2;
    reg `DataBus o_ReadData2;
    reg i_we;
    reg `RegAddrWide i_WriteReg;
    reg `DataBus i_WriteData;    
    assign ReadData1 = o_ReadData1;
    assign ReadData2 = o_ReadData2;
    always @ clk
    begin
        i_clk = clk;
    end
    always @ reset
    begin
        i_reset = reset;
    end      
    always @ ce
    begin
        i_ce = ce;
    end
    always @ re1
    begin
        i_re1 = re1;
    end   
    always @ ReadReg1
    begin
        i_ReadReg1 = ReadReg1;
    end   
    always @ re2
        begin
            i_re2 = re2;
        end   
    always @ ReadReg2
    begin
        i_ReadReg2 = ReadReg2;
    end  
    always @ we
    begin
        i_we = we;
    end
    always @ WriteReg
    begin
        i_WriteReg = WriteReg;
    end
    always @ WriteData
    begin
        i_WriteData = WriteData;
    end

    //¶¨Òå¼Ä´æÆ÷×é
    reg `DataBus Regsiter [`NumRegs-1:0];
    
    //±ØÒªµÄ³õÊ¼»¯
    integer i = 0;
    initial
    begin
        i = 0;
        for(i = 0; i < `NumRegs-1; i=i+1)
        begin
            Regsiter[i] = 0;
        end
        
        i_reset = `ResetDisable;
        i_clk = 0;
        i_ce = `ChipEnable; 
        i_re1 = `ReadEnable;
        i_ReadReg1 = 0;
        o_ReadData1 = `NonData;
        i_re2 = `ReadEnable;
        i_ReadReg2 = 0;
        o_ReadData2 = `NonData;
        i_we = `WriteEnable;
        i_WriteReg = 0;
        i_WriteData = `NonData; 
    end
  
    //¶Á¼Ä´æÆ÷1Âß¼­
    always @ (posedge clk)
    begin
        if(i_reset == `ResetDisable && i_ce == `ChipEnable)
        begin
            if(i_re1 == `ReadEnable && i_ReadReg1 != 0)
            begin
                o_ReadData1 = Regsiter[i_ReadReg1];
            end
            
            else
            begin
                o_ReadData1 = `NonData;
            end  
        end
        
        else
        begin
            if(i_reset == `ResetEnable)
            begin
                o_ReadData1 = `NonData;
            end
            
            if(i_ce == `ChipDisable)
            begin
                o_ReadData1 = `NonData;
            end
        end
    end

    //¶Á¼Ä´æÆ÷2Âß¼­
    always @ (posedge clk)
    begin
        if(i_reset == `ResetDisable && i_ce == `ChipEnable)
        begin
            if(i_re2 == `ReadEnable && i_ReadReg2 != 0)
            begin
                o_ReadData2 = Regsiter[i_ReadReg2];
            end
            
            else
            begin
                o_ReadData2 = `NonData;
            end  
        end
        
        else
        begin
            if(i_reset == `ResetEnable)
            begin
                o_ReadData2 = `NonData;
            end
            
            if(i_ce == `ChipDisable)
            begin
                o_ReadData2 = `NonData;
            end
        end
    end
    //Ð´¼Ä´æÆ÷Âß¼­ 
    always @ (posedge clk)
    begin
        if(i_reset == `ResetDisable && i_ce == `ChipEnable)
        begin
            if(i_we == `ReadEnable)
            begin
                Regsiter[i_WriteReg] = i_WriteData;
            end
            
            else
            begin
                Regsiter[i_WriteReg] = `NonData;
            end  
        end
        
        else
        begin
            if(i_reset == `ResetEnable)
            begin
                Regsiter[i_WriteReg] = `NonData;
            end
            
            if(i_ce == `ChipDisable)
            begin
                Regsiter[i_WriteReg] = `NonData;
            end
        end
    end  
endmodule
