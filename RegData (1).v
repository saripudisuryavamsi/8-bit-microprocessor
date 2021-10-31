`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module RegData(clk,read_reg,write_enable,write_data ,read_data1 ,read_data2);
input clk;              
input [2:0]read_reg;
input [7:0]write_data;
input write_enable;
output [7:0] read_data1;
output [7:0] read_data2;      

reg [7:0] temp_reg0= 8'b00000000;
reg [7:0] temp_reg1= 8'b00000001;


always@(posedge clk)
    begin
     if ((write_enable) & (~read_reg[2]))
     temp_reg0 = write_data;
     else if ((write_enable) &  read_reg[2])
     temp_reg1<=write_data;   
end

assign read_data1 = temp_reg0;
assign read_data2 = temp_reg1;

endmodule

//begin
//     if (reset==1) 
//          read_data1 <= 8'b00000000;  
//      else if( (read_reg1) & (~write_reg1))
//           temp_reg0 <= write_data;
//      else if(write_reg1)
//            read_data1 <= temp_reg0;
            
//end
//// ~write_reg1 is low siganl for the registers to read from the input data( write_data)and write in the
//// temporary regsters r0 and r1. while write_reg if high the data from the temporary reg is written at
//// the output read_data1 or read_data1
//always@(posedge clk)
//begin 
//     if (reset==1) 
//          read_data2 <= 8'b00000000;  
//      else if( (read_reg2) & (~write_reg1))
//           temp_reg1 <= write_data;
//      else if(write_reg1)
//            read_data2 <= temp_reg1;            
//end
//endmodule


/////////////////////////////////////////////////
//module RegData(read_data1 ,read_data2, read_reg1, read_reg2,  
//               write_data, write_reg1);
//input read_reg1,read_reg2;
//input [7:0]write_data;
//input write_reg1;
//output reg [7:0] read_data1= 8'b00000000;
//output reg [7:0] read_data2= 8'b00000000;

//reg [7:0] reg_Mem [0:10];
//integer i;
//initial 
//begin
//    for(i=0; i<8; i=i+1)
//        reg_Mem[i]=0;
//end

//always@(read_reg1, read_reg2,  
//        write_data, write_reg1)

//if( write_reg1==1'b1)
//    reg_Mem[