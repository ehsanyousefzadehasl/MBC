`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

module DFF(
		input D, clock, clear, enable,
		output reg Q
    );
	 
	 always@(posedge clock, posedge clear)
		if(clear)
        begin
		    Q <= 0;
        end
		else if(enable)
            begin
			    Q <= D;
            end
endmodule