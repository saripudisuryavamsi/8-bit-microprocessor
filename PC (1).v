`timescale 1ns / 1ps

module PC(Q, D, clk, reset, enable);
input  clk, reset, enable;   
input  [7:0] D;       
output reg [7:0] Q=8'b00000000;

always @(posedge clk)
    begin
      #2;
      if (reset == 1)
        Q=8'b00000000;
      else if(enable == 1)
        Q=D;
    end
endmodule


