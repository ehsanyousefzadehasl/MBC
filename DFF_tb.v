`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

module DFF_tb;

reg D_IN, CLOCK, CLEAR, ENABLE;
wire Q;

DFF dff(D_IN, CLOCK, CLEAR, ENABLE, Q);

initial
begin
    ENABLE = 1;
    CLOCK = 0;
    CLEAR = 0;
    D_IN = 1;

    #10
    ENABLE = 1;
    CLEAR = 0;
    D_IN = 1;

    #15
    ENABLE = 1;
    CLEAR = 1;
    D_IN = 1;

    #10
    ENABLE = 0;
    CLEAR = 1;
    D_IN = 1;

    #10
    ENABLE = 1;
    CLEAR = 0;
    D_IN = 1;

    #10
    ENABLE = 1;
    CLEAR = 0;
    D_IN = 0    ;
end


always
begin
    #5
    CLOCK = !CLOCK;
end

endmodule