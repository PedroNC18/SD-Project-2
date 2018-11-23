module conversaodec_bin(registradorin, registradorout);

	input registradorin;
	output [15:0] registradorout;
	reg [15:0] registradorout;
	wire registradorin;
	reg aux;
	
	initial begin
		aux <= registradorin;
	end
	
	
	always @(*) begin
		registradorout[3:0] <= aux % 10;
		aux <= aux / 10;
		registradorout[7:4] <= aux % 10;
		aux <= aux / 10;
		registradorout[11:8] <= aux % 10;
		aux <= aux / 10;
		registradorout[15:12] <= aux % 10;
	end

endmodule
