`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

module memory
	#(parameter A = 12, D = 16) // 4096 x 16 memory
	(
    input clock, write_enable, // clock signal, signal for enabling writing
    input [A - 1 : 0] address, // address of the desired word
	  input [D - 1 : 0] input_data, // input data for store in the memory
    output reg [D - 1 : 0] output_data // output data of the memory
    );

	reg [D - 1 : 0] read_memory [2 ** A - 1 : 0]; // our memory 4096 cells

	initial begin // filling our memory with instructions			
	$readmemh("instructions.txt", read_memory, 0, 4095);
	end
	
	// This memory is synchronous with the clock - working just on positive edges
	always@(posedge clock)
		begin
		if(write_enable) // writes data if only the write enable signal is set to one
			begin
				read_memory[address] <= input_data;
			end
	// Otherwise, it is considered that a word is needed to be read
   	output_data <= read_memory[address];
		end
				
endmodule