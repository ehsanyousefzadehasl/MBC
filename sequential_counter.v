// Note: while using this unit, first it has to be reset to start (reset = 1)
// You can check it in the test bench of this module sc_tb.v

module sequential_counter #(parameter n=4)(
    input clock,enable,
    input reset,
    output reg[n-1:0] out
    );
	
	always@(posedge clock, posedge reset)
		if(reset)
			out <= 0;
		else if(enable)
			out <= out + 1;

endmodule