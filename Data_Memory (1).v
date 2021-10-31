`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module Data_Memory(readdata , address, writedata , mem_write); 
input [7:0] address , writedata ; 
input mem_write;    //not(mem_write) is memread;
output [7:0] readdata; 
reg [7:0] readdata;
reg [7:0] DM_array [0:11]; 
integer i;
initial begin
for(i=0;i<12;i=i+1)
  DM_array[i]=i;
end

always@(mem_write or address)
begin
 if(mem_write==1'b1) 
readdata=DM_array[address];
else 
 DM_array[address]=writedata;
 end
endmodule 
