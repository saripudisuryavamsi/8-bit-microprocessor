`timescale 1ns / 1ps


module TopLevel(clk, reset,enable);
input clk;
input reset, enable;

wire [7:0] adder_out;
wire [7:0] PC_out;

Adder8Bit UUT1(
          .clk(clk),
          .out(adder_out),
          .a(8'b00000001),
          .b(PC_out)
          );

// PC
PC UUT2(
        .Q(PC_out), 
        .D(adder_out), 
        .clk(clk), 
        .reset(reset), 
        .enable(enable)
        );


// Instruction Memory:
wire [7:0]instruction_out;

InstructionMemory UUT3(
        .clk(clk),
        .PC(PC_out),
        .instruction(instruction_out)
        );

wire write_enable,aluop,alusrc, mem_write;
Control_Unit UUT4(
            .clk(clk),
            .opcode(instruction_out[7:5]), 
            .write_enable(write_enable),
            .aluop(aluop),
            .alusrc(alusrc), 
            .mem_write(mem_write)
            );

wire [7:0] write_data,read_data1, read_data2;
RegData UUT5(
            .clk(clk),
            .read_reg(instruction_out[5:3]),
            .write_enable(write_enable),
            .write_data(write_data) ,
            .read_data1(read_data1) ,
            .read_data2(read_data2)
            );

//wire [7:0] Alu_out;
ALU_8bit UUT6(
            .result(write_data), // (Alu_out);
            .a(read_data1),
            .b(read_data2),
            .sel(aluop)
            );
            
            
endmodule
