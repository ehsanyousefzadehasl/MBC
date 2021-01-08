`timescale 1ns / 100ps // time-unit = 1 ns, precision = 100 ps

module datapath_with_control_unit #(parameter d = 16)(
		input clk, reset, en,
		output [d-1:0] cu_data, ac_data
    );
	 	 
	 wire ar_we, ar_inc;	 
	 wire [11:0] ar_idat, ar_odat; 
	 wire pc_we, pc_inc;	 
	 wire [7:0] pc_idat, pc_odat;
	 wire ir_inc;	 
	 wire [d-1:0] ir_idat, ir_odat;
	 wire ac_we, ac_inc;	 
	 wire [d-1:0] ac_idat, ac_odat;
	 wire dr_we, dr_inc;	 
	 wire [d-1:0] dr_idat, dr_odat;
	 
	 wire [d-1:0] mem_dat;		//memory
	 wire mem_we;
	 
	 wire [15:0] dec_signal;	//decoders
	 wire [7:0] dec_opcode;
	 
	 wire [d-1:0] data;			//alu var
	 wire [3:0] ctrl_alu;
	 wire ei, eo, pcinc;
	 
	 wire ff_en;				//E var

	 //memory
	 memory rom (.clock(clk), .address(ar_odat), .write_enable(mem_we), .input_data(ac_odat), .output_data(mem_dat));
	  
     //seq counter & decoder
	 signals sig (.reset(reset), .clock(clk), .dec_signal(dec_signal), .enable(en));
     
     //registers
	 register #(.n(12)) ar (.write_enable(ar_we), .increment_signal(ar_inc), .clear(reset), .input_data(ar_idat), .output_data(ar_odat), .clock(clk));
	 register pc (.write_enable(pc_we), .increment_signal(pc_inc), .clear(reset), .input_data(pc_idat), .output_data(pc_odat), .clock(clk));
	 register #(.n(16)) ir (.write_enable(dec_signal[2]), .increment_signal(ir_inc), .clear(reset), .input_data(ir_idat), .output_data(ir_odat), .clock(clk));
	 register #(.n(16)) dr (.write_enable(dr_we), .increment_signal(dr_inc), .clear(reset), .input_data(dr_idat), .output_data(dr_odat), .clock(clk));
	 register #(.n(16)) ac (.write_enable(ac_we), .increment_signal(ac_inc), .clear(reset), .input_data(ac_idat), .output_data(ac_odat), .clock(clk));
    
     // ALU Unit
	 alu unit (.AC(ac_odat), .DR(dr_odat), .code(ctrl_alu), .EI(ei), .EO(eo), .INC(pcinc), .data(data));

     // E Flip Flop
	 DFF E (.clock(clk), .D(eo), .Q(ei), .clear(reset), .enable(ff_en));

     // opcode decoder
	 opcode_decoder decode_ir (.opcode(ir_odat[14:12]), .decoded_signal(dec_opcode));
	 
     // Control Unit
	 control_unit control (.alu_pcinc(pcinc),
						.dec_signal(dec_signal),
						.ar_idat(ar_idat),
						.ir_idat(ir_idat),
						.dr_idat(dr_idat),
						.ac_idat(ac_idat),
						.mem_dat(mem_dat),
						.pc_odat(pc_odat),
						.ir_odat(ir_odat),
						.ar_we(ar_we),
						.dr_we(dr_we),
						.ac_we(ac_we),
						.pc_inc(pc_inc),
						.ff_en(ff_en),
						.mem_we(mem_we),
						.ctrl_alu(ctrl_alu),
						.alu_data(data),
						.dec(dec_opcode)
					  );
					  
	 assign cu_data = (((~dec_opcode[7]) && dec_signal[11]) | (dec_opcode[7] && dec_signal[8])) ? ac_odat : {d{1'bz}};
	 assign ac_data = ac_odat;	  
endmodule