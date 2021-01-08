`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

module final_tb;

 reg clk = 1'b0;
    reg reset = 1'b0;
    reg en = 1'b0;
    wire [15:0] cu_data;
    wire [15:0] ac_data;

    parameter PERIOD = 200;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 100;

    initial    // Clock process for clk
    begin
        #OFFSET;
        forever
        begin
            clk = 1'b0;
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
            #(PERIOD*DUTY_CYCLE);
        end
    end

    datapath_with_control_unit UUT (
        .clk(clk),
        .reset(reset),
        .en(en),
        .cu_data(cu_data),
        .ac_data(ac_data));

    initial begin

        #100;
        reset = 1'b1;
        // -------------------------------------
        // -------------  Current Time:  185ns
        #85;
        reset = 1'b0;
        en = 1'b1;

    end

endmodule