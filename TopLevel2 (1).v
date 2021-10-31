`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 


module TopLevel2(clk, reset,enable);
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

wire write_enable,aluop,alusrc, mem_write, memtoreg;
Control_Unit UUT4(
            .clk(clk),
            .opcode(instruction_out[7:5]), 
            .write_enable(write_enable),
            .aluop(aluop),
            .alusrc(alusrc), 
            .mem_write(mem_write),
            .memtoreg(memtoreg)
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
            
wire [7:0] Sign8bits;
SignExtend UUT51(
                .out(Sign8bits),
                .in(instruction_out[2:0])
                );
                
wire [7:0] Mux_Regout;
Mux2to1_8Bit UUT52(
                .in0(read_data2),
                .in1(Sign8bits),
                .sel(alusrc),
                .Mux_out(Mux_Regout)
                );

wire [7:0] Alu_out;
ALU_8bit UUT6(
            .result(Alu_out), // (Alu_out);
            .a(read_data1),
            .b(Mux_Regout),
            .sel(aluop)
            );
            
wire [7:0] Mem_out;
Data_Memory UUT7(
            .readdata(Mem_out) , 
            .address(Alu_out), 
            .writedata(read_data2) ,
            .mem_write(mem_write)
            );         
              
Mux2to1_8Bit UUT8(
            .in0(Alu_out),
            .in1(Mem_out),
            .sel(memtoreg),
            .Mux_out(write_data)
            );       
            
endmodule
