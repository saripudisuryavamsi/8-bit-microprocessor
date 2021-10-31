`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module Mux2to1_8Bit(in0,in1,sel,Mux_out);
input [7:0] in0;
input [7:0] in1;
input sel;
output [7:0] Mux_out;

assign Mux_out = sel?in1:in0;

endmodule
