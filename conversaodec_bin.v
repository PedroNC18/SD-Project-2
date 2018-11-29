module conversaodec_bin(registradorin, registradorout);

	input [15:0] registradorin;
	output [15:0] registradorout;
	reg [15:0] registradorout;
	wire [15:0] registradorin;
	reg [15:0] aux;
	
	reg [15:0] a;
	reg [15:0] a2;
	reg [15:0] a3;
	reg [15:0] a4;
	reg [15:0] a5;
	reg [15:0] b;
	reg [15:0] b2;
	reg [15:0] b3;
	always @(*) begin
		aux <= registradorin;
		b <= aux;
		registradorout[3:0] <= aux % 10;
		a <= b / 10;
		a2 <= a;
		b2 <= a2;
		registradorout[7:4] <= a2 % 10;
		a3 <= b2 / 10;
		a4 <= a3;
		b3 <= a4;
		registradorout[11:8] <= a4 % 10;
		a5 <= b3 / 10;
		registradorout[15:12] <= a5 % 10;
	end

endmodule
