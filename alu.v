// This ALU is a 16-bit wide arithmetic unit
// inc = signal for increasing PC (Program Counter)
`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps
module alu(
		input [15:0] AC,
		input DR,
		input [3:0] code,
		input EI,		// EI -> input from E-FF
		output EO, 		// EO -> output to 	E-FF
		output INC,		// signal for detecting performing increment on PC (Program Counter)
		output [15:0] data
    );

	 reg [16:0] TMP = 0;
	 assign EO = 	(code == 4'b0100) ? AC[0] : 	// CIR
					(code == 4'b0101) ? AC[15] : 	// CIL
					(code == 4'b1000) ? 0 :			// clear E (CLE)
					(code == 4'b1001) ? ~EI :		// complement E (CME)
					TMP[16];

	 assign INC = 	(code == 4'b1010) ? ~AC[15] :		      // skip if positive (SPA)
					(code == 4'b1011) ? AC[15] :			  // skip if negative (SNA)
					((code == 4'b1100) && (AC == 0)) ? 1'b1 : // skip if AC = 0 (SZA)
					(code == 4'b1101) ? ~EI : 0;			  // skip if E = 0  (SZE)

	 always@* // build the sensitivity list for all inputs
		case(code)

			4'b0000 : TMP <= AC & DR; 			// AND
			4'b0001 : TMP <= AC + DR; 			// ADD
			4'b0010 : TMP <= DR;				// LDA
			4'b0011 : TMP <= ~AC;				// CMA
			4'b0100 : TMP <= {{EI},{AC[15:1]}};	// CIR
			4'b0101 : TMP <= {{AC[14:0]},{EI}};	// CIL
			4'b0110 : TMP <= 0;					// CLA
			4'b0111 : TMP <= AC + 1;			// INC
			default : TMP <= 17'bz;				// high impedance because no arithmetic operation is needed
 		
		endcase

	 assign data = TMP[15:0];
endmodule