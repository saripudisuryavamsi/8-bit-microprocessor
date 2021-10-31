`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Test_Bench(

    );
    reg clk,reset,enable;

TopLevel2 UUT(
            .clk(clk),
            .reset(reset),
            .enable(enable)
            );
initial 
begin
clk =1'b0;
reset=1'b1;
enable=1'b0;
#60 reset=1'b0;
enable=1'b1;
#260 $finish;

end          
            
always #20 clk=~clk;

endmodule
