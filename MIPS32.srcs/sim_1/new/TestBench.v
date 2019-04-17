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
    reg i_clk;
    reg i_reset;
    reg `InstrBus i_instr;
    reg i_write_reg_ce;
    reg `RegBus i_write_reg_addr;
    reg `DataBus i_write_reg_data;
    
    wire  `DataBus o_operand1;
    wire  `DataBus o_operand2;
    wire  [2:0] o_op_type;
    wire  [7:0] o_sub_op_type;
    wire o_write_reg_ce;
    wire `RegBus o_write_reg_add;
    
    initial
    begin
        i_clk = 0;
        i_reset = `ResetDisable;
        i_instr = 32'b00110100000000001010101010101010;
        i_write_reg_ce = `NonData;
        i_write_reg_addr = `NonData;
        i_write_reg_data = `NonData;
        
        #20 
        i_clk = ~i_clk;
        #10
        i_clk = ~i_clk;
        i_instr = 0;
        #200
                i_clk = ~i_clk;
                #10
                i_clk = ~i_clk;
    end
    
    Instr_Decode Instr_Decode0(
     i_clk,
         i_reset,
          i_instr,
         i_write_reg_ce,
          i_write_reg_addr,
          i_write_reg_data,
        
        o_operand1,
        o_operand2,
        o_op_type,
        o_sub_op_type,
        o_write_reg_ce,
        o_write_reg_add
     );    

    
   
endmodule
