module register_tb;

    reg INCREMENT;
    reg WRITE_ENABLE;
    reg CLEAR;
    reg CLOCK;
    reg [7:0] INPUT_DATA;

    wire [7:0] OUTPUT_DATA;

    register REG(INCREMENT, WRITE_ENABLE, CLEAR, CLOCK, INPUT_DATA, OUTPUT_DATA);

    initial
    begin
        CLOCK = 0;

        INCREMENT = 0;
        WRITE_ENABLE = 1;
        CLEAR = 0;
        INPUT_DATA = 8'b00000000;

        #50
        INCREMENT = 1;
        WRITE_ENABLE = 0;
        CLEAR = 0;
        INPUT_DATA = 8'b01010101;

        #50
        INCREMENT = 0;
        WRITE_ENABLE = 1;
        CLEAR = 0;
        INPUT_DATA = 8'b01010101;

        #50
        INCREMENT = 0;
        WRITE_ENABLE = 0;
        CLEAR = 1;
        INPUT_DATA = 8'b01010101;
    end

    always
    begin
        #10
        CLOCK = !CLOCK;
    end
endmodule