module conversaobin_dec(registradorin, registradorout);
	input [15:0] registradorin;
	output [15:0]registradorout;
	reg [15:0]registradorout;
	reg[3:0] del;
	reg[3:0] del2;
	reg[3:0] del3;
	reg[3:0] del4;
	
	always @(*) begin
		del <= registradorin[3:0];
		del2 <= registradorin[7:4];
		del3 <= registradorin[11:8];
		del4 <= registradorin[15:12];
		//del <= (del * 10);
		//del2 <= (del * 100);
		/*
		registradorout <= registradorout + del;
		registradorout <= registradorout + (del2 * 10);
		registradorout <= registradorout + (del3 * 100);
		registradorout <= registradorout + (del4 * 1000);
		*/
		registradorout <= del + (del2*10) + (del3*100) + (del4*1000);
		//registradorout <= 16'b1000000100000000;
	end
	
endmodule
