`timescale 1ns / 1ps // time-unit = 1 ns, precision = 10 ps
module alu_tb;

reg [15:0] AC;  // Accumulator
reg [15:0] DR;  // Data Register
reg [3:0] code; // signals
reg EI;          // E FF

wire [15:0] DATAOUT;
wire INC;
wire EO;

// duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
localparam period = 20;


alu ALU(AC, DR, code, EI, EO, INC, DATAOUT);


always
begin
    AC = 16'b0000000000000001;
    DR = 16'b0000000000000001;
    code = 4'b0000;
    EI = 1'b1;

    #period
    AC = 16'b0000110000000001;
    DR = 16'b0100000000000001;
    code = 4'b0001;
    EI = 1'b0;
    
    #period
    AC = 16'b000000110000001;
    DR = 16'b011000000010001;
    code = 4'b0010;
    EI = 1'b0;

    #period
    AC = 16'b000000110000001;
    DR = 16'b0110001000100001;
    code = 4'b0011;
    EI = 1'b0;

    #period
    AC = 16'b010000110000001;
    DR = 16'b011000110001001;
    code = 4'b0100;
    EI = 1'b0;

    #period
    AC = 16'b010000110100001;
    DR = 16'b011000110001001;
    code = 4'b0101;
    EI = 1'b0;

    #period
    AC = 16'b010000110100001;
    DR = 16'b011000110001001;
    code = 4'b0110;
    EI = 1'b0;

    #period
    AC = 16'b010000110100001;
    DR = 16'b011000110001001;
    code = 4'b0111;
    EI = 1'b0;

    #period
    AC = 16'b010000110100001;
    DR = 16'b011000110001001;
    code = 4'b1000;
    EI = 1'b0;

    #period
    AC = 16'b010000110100001;
    DR = 16'b011000110001001;
    code = 4'b1001;
    EI = 1'b0;

    #period
    AC = 16'b010000110100001;
    DR = 16'b011000110001001;
    code = 4'b1100;
    EI = 1'b0;

    #period
    AC = 16'b010000110100001;
    DR = 16'b011000110001001;
    code = 4'b1101;
    EI = 1'b0;
end
    
endmodule