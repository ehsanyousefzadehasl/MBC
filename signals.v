`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

// This module encompasses sequential counter and decoder
module signals(
		input reset, clock, enable,
		output [15:0] dec_signal
    );

     wire [3:0] sc_signal;
	 
	 sequential_counter SC (clock, enable, reset, sc_signal);	
	 decoder DEC (sc_signal, dec_signal);

endmodule