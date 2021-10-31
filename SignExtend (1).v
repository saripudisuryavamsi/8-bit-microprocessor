`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module SignExtend (out, in); 
input [2:0]in; 
output [7:0]out; 
 
 assign out  = {{5{in[2]}},in}; // sign bits of input are 
 //concantenated to extended option for 8 bits
  
endmodule