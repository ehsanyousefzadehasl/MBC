`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

module sc_tb;
    reg CLOCK;
    reg ENABLE;
    reg RESET;

    wire [3:0] OUT;

    sequential_counter SC(CLOCK, ENABLE, RESET, OUT);

    initial begin
        CLOCK = 0;
        RESET = 0;
        ENABLE = 1;
        RESET = 1;
        #20
        RESET = 0;
    end

    always
    begin
        #10
        CLOCK = !CLOCK;
    end

endmodule