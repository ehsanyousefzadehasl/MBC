`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

module signals_tb;

reg RESET;
reg CLOCK;
reg ENABLE;

wire[15:0] OUT_SIGNALS;

signals STEPS(RESET, CLOCK, ENABLE, OUT_SIGNALS);

initial
begin
    CLOCK = 0;

    RESET = 1;
    ENABLE = 1;

    #20
    RESET = 0;
    ENABLE = 1;
end

always
begin
    #10
    CLOCK = !CLOCK;    
end

endmodule