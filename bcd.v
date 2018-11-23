module bcd(registrador, a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2, a3, b3, c3, d3, e3, f3, g3, a4, b4, c4, d4, e4, f4, g4);
	input [15:0] registrador;
	output a1, b1, c1, d1, e1, f1, g1;
	output a2, b2, c2, d2, e2, f2, g2;
	output a3, b3, c3, d3, e3, f3, g3;
	output a4, b4, c4, d4, e4, f4, g4;
	reg [6:0] SeteSegmentos;
	reg [6:0] SeteSegmentos2;
	reg [6:0] SeteSegmentos3;
	reg [6:0] SeteSegmentos4;
	
	always @(*) begin
		case({registrador[0], registrador[1], registrador[2], registrador[3]}) 
			4'b0000: SeteSegmentos = 7'b1111110;
			4'b0001: SeteSegmentos = 7'b0110000;
			4'b0010: SeteSegmentos = 7'b1101101;
			4'b0011: SeteSegmentos = 7'b1111001;
			4'b0100: SeteSegmentos = 7'b0110011;
			4'b0101: SeteSegmentos = 7'b1011011;
			4'b0110: SeteSegmentos = 7'b0011111;
			4'b0111: SeteSegmentos = 7'b1110000;
			4'b1000: SeteSegmentos = 7'b1111111;
			4'b1001: SeteSegmentos = 7'b1110011;
			default: SeteSegmentos = 7'b0000000;
		endcase
		case({registrador[4], registrador[5], registrador[6], registrador[7]}) 
			4'b0000: SeteSegmentos2 = 7'b1111110;
			4'b0001: SeteSegmentos2 = 7'b0110000;
			4'b0010: SeteSegmentos2 = 7'b1101101;
			4'b0011: SeteSegmentos2 = 7'b1111001;
			4'b0100: SeteSegmentos2 = 7'b0110011;
			4'b0101: SeteSegmentos2 = 7'b1011011;
			4'b0110: SeteSegmentos2 = 7'b0011111;
			4'b0111: SeteSegmentos2 = 7'b1110000;
			4'b1000: SeteSegmentos2 = 7'b1111111;
			4'b1001: SeteSegmentos2 = 7'b1110011;
			default: SeteSegmentos2 = 7'b0000000;
		endcase
		case({registrador[8], registrador[9], registrador[10], registrador[11]}) 
			4'b0000: SeteSegmentos3 = 7'b1111110;
			4'b0001: SeteSegmentos3 = 7'b0110000;
			4'b0010: SeteSegmentos3 = 7'b1101101;
			4'b0011: SeteSegmentos3 = 7'b1111001;
			4'b0100: SeteSegmentos3 = 7'b0110011;
			4'b0101: SeteSegmentos3 = 7'b1011011;
			4'b0110: SeteSegmentos3 = 7'b0011111;
			4'b0111: SeteSegmentos3 = 7'b1110000;
			4'b1000: SeteSegmentos3 = 7'b1111111;
			4'b1001: SeteSegmentos3 = 7'b1110011;
			default: SeteSegmentos3 = 7'b0000000;
		endcase
		case({registrador[12], registrador[13], registrador[14], registrador[15]}) 
			4'b0000: SeteSegmentos4 = 7'b1111110;
			4'b0001: SeteSegmentos4 = 7'b0110000;
			4'b0010: SeteSegmentos4 = 7'b1101101;
			4'b0011: SeteSegmentos4 = 7'b1111001;
			4'b0100: SeteSegmentos4 = 7'b0110011;
			4'b0101: SeteSegmentos4 = 7'b1011011;
			4'b0110: SeteSegmentos4 = 7'b0011111;
			4'b0111: SeteSegmentos4 = 7'b1110000;
			4'b1000: SeteSegmentos4 = 7'b1111111;
			4'b1001: SeteSegmentos4 = 7'b1110011;
			default: SeteSegmentos4 = 7'b0000000;
		endcase
	end
	
	assign {a1, b1, c1, d1, e1, f1, g1} = SeteSegmentos;
	assign {a2, b2, c2, d2, e2, f2, g2} = SeteSegmentos2;
	assign {a3, b3, c3, d3, e3, f3, g3} = SeteSegmentos3;
	assign {a4, b4, c4, d4, e4, f4, g4} = SeteSegmentos4;
	
endmodule
