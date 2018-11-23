module conversaobin_dec(registradorin, registradorout);
	input [15:0] registradorin;
	output registradorout;
	reg registradorout;
	
	always @(*) begin
		registradorout <= registradorout + registradorin[3:0];
		registradorout <= registradorout + (registradorin[7:4] * 10);
		registradorout <= registradorout + (registradorin[11:8] * 100);
		registradorout <= registradorout + (registradorin[15:12] * 1000);
	end
	
endmodule
