`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////


module Reg8bit(Q, D, clk, reset,enable);
   input D, clk, reset,enable;
   output Q;
   reg Q;
   always @(posedge clk)
    begin
      #2;
      if (reset == 1)
       Q=0;
      else if(enable == 1)
       Q=D;
    end
endmodule

