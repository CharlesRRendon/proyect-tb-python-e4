`include "pc.sv"
`include "Registers_bank.sv"
`include "Instruction_memory.sv"
`include "adder.sv"
`include "ALU.sv"
`include "alu_control.sv"
 

module Top_Module(
          intput clk, rst,
          inout out_G);
  input clk, rst;
  output reg [31:0] out_G;
  wire [31:0] in_pc_w1, out_pc_w2,out_im_w3,out_rb_w4,out_rb_w5,out_aluc_w6,out_alu_w7;
  reg [31:0] cnt_adder;
  
  
  
  initial 
    cnt_adder = 32'd4;
  
  assign out_G = out_alu_w7;
  
  pc 	pc_top (clk, rst, in_pc_w1, out_pc_w2);
  adder adder_top(out_pc_w2,cnt_adder,in_pc_w1);
  Instruction_memory instruction_memory_top(clk,out_pc_w2,out_im_w3);
  Registers_bank Registers_bank_top(clk,0,out_im_w3[25:21],out_im_w3[20:16],out_im_w3[15:11],out_rb_w4,out_rb_w5,out_alu_w7);
  ALU ALU_top(out_rb_w4,out_rb_w5,out_aluc_w6,out_alu_w7);
  alu_control alu_control_top(out_im_w3[5:0],2'b00,out_aluc_w6);
endmodule