`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

module register #(parameter n=8)
	(
    input increment_signal, write_enable,
    input clear, clock,
    input [n-1:0] input_data,
    output [n-1:0] output_data
    );
	 
	reg [n-1:0] data;
	
	always@(posedge clock, posedge clear)
		if(clear)
			data <= 0;
		else if(increment_signal)
			data <= data + 1;
		else if(write_enable)
			data <= input_data;
			
	assign output_data = data;

endmodule