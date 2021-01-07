module opcode_decoder(
		input [2:0] opcode,
		output [7:0] decoded_signal
    );
	 
	 reg [7:0] temp_reg;
	 
	 always@*
		case(opcode)
			3'h0 : temp_reg <= 8'h01;
			3'h1 : temp_reg <= 8'h02;
			3'h2 : temp_reg <= 8'h04;
			3'h3 : temp_reg <= 8'h08;
			3'h4 : temp_reg <= 8'h10;
			3'h5 : temp_reg <= 8'h20;
			3'h6 : temp_reg <= 8'h40;
			3'h7 : temp_reg <= 8'h80;
		endcase
		
	assign decoded_signal = temp_reg;

endmodule