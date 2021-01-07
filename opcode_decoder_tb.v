module opcode_decoder_tb;

    reg [2:0] OPCODE;
    wire [7:0] DECODED_SIGNAL;

    opcode_decoder OD(OPCODE, DECODED_SIGNAL);

    initial
    begin
        OPCODE = 3'b000;

        #10
        OPCODE = 3'b001;

        #10
        OPCODE = 3'b010;

        #10
        OPCODE = 3'b011;

        #10
        OPCODE = 3'b100;

        #10
        OPCODE = 3'b101;

        #10
        OPCODE = 3'b110;

        #10
        OPCODE = 3'b111;      
    end

endmodule