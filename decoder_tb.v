module decoder_tb;
    reg [3:0] IN_DATA;
    
    wire [15:0] OUT_DATA;

    decoder DEC(IN_DATA, OUT_DATA);

    initial
    begin
        IN_DATA = 4'b0000;

        #15
        IN_DATA = 4'b0001;

        #15
        IN_DATA = 4'b0010;

        #15
        IN_DATA = 4'b0011;

        #15
        IN_DATA = 4'b0100;

        #15
        IN_DATA = 4'b0101;

        #15
        IN_DATA = 4'b0110;

        #15
        IN_DATA = 4'b0111;

        #15
        IN_DATA = 4'b1000;

        #15
        IN_DATA = 4'b1001;

        #15
        IN_DATA = 4'b1010;

        #15
        IN_DATA = 4'b1011;

        #15
        IN_DATA = 4'b1100;

        #15
        IN_DATA = 4'b1101;

        #15
        IN_DATA = 4'b1110;

        #15
        IN_DATA = 4'b1111;
    end

endmodule