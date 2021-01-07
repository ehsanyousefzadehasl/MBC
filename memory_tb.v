`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

module memory_tb;

reg [15:0] DATA_IN;
reg [11:0] ADDRESS;
reg WRITE_ENABLE;
reg CLOCK;

wire [15:0] DATA_OUT;

localparam delay = 500;
localparam period = 10;

memory MEM(CLOCK, WRITE_ENABLE, ADDRESS, DATA_IN, DATA_OUT);


initial begin
    CLOCK = 0;
    DATA_IN = 16'b0000000000000001;
    ADDRESS = 12'b000000000000;
    WRITE_ENABLE = 1'b0;

    #delay
    DATA_IN = 16'b0000000000000001;
    ADDRESS = 12'b000000000001;
    WRITE_ENABLE = 1'b0;

    #delay
    DATA_IN = 16'b0000000000000001;
    ADDRESS = 12'b000000000010;
    WRITE_ENABLE = 1'b0;

    #delay
    DATA_IN = 16'b0000000000000011;
    ADDRESS = 12'b000000000010;
    WRITE_ENABLE = 1'b0;

    #delay
    DATA_IN = 16'b0000000000000100;
    ADDRESS = 12'b000000000010;
    WRITE_ENABLE = 1'b0;

    #delay
    DATA_IN = 16'b0000000000000100;
    ADDRESS = 12'b000000001111;
    WRITE_ENABLE = 1'b0;

    #delay
    DATA_IN = 16'b0011110000000100;
    ADDRESS = 12'b000000001111;
    WRITE_ENABLE = 1'b1;

    #delay
    DATA_IN = 16'b0000000000000100;
    ADDRESS = 12'b000000001111;
    WRITE_ENABLE = 1'b0;
end

always
begin
    #period
    CLOCK = !CLOCK;
end

endmodule