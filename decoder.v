`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

module decoder #(parameter n=4)(
    input [n - 1 : 0] in_data,
    output [2 ** n - 1 : 0] out_data
    );
	 
	 reg [2 ** n - 1 : 0] tmp_reg;
	 
	 always@*
		case(in_data)
			4'h0 : tmp_reg <= 16'h0001;
			4'h1 : tmp_reg <= 16'h0002;
			4'h2 : tmp_reg <= 16'h0004;
			4'h3 : tmp_reg <= 16'h0008;
			4'h4 : tmp_reg <= 16'h0010;
			4'h5 : tmp_reg <= 16'h0020;
			4'h6 : tmp_reg <= 16'h0040;
			4'h7 : tmp_reg <= 16'h0080;
			4'h8 : tmp_reg <= 16'h0100;
			4'h9 : tmp_reg <= 16'h0200;
			4'ha : tmp_reg <= 16'h0400;
			4'hb : tmp_reg <= 16'h0800;			
			4'hc : tmp_reg <= 16'h1000;
			4'hd : tmp_reg <= 16'h2000;
			4'he : tmp_reg <= 16'h4000;
			4'hf : tmp_reg <= 16'h8000;
			endcase
		
	assign out_data = tmp_reg;

endmodule