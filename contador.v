module contador(clk, sel, tempo, segundos);
	input clk; // negocio la
	input sel; // selecao do que vai acontecer (0 : cronometro e 1 : temporizador)
	input [15:0] tempo; // quanto tempo queremos q rode
	output [15:0] segundos; // o numero que vai estar saindo do contador
	reg[25:0] cont;
	reg [15:0] segundos;
	
	reg [25:0] piroquinha;
	reg [15:0] segundim;
	
	reg flag;
	initial begin
		flag <= 0;
	end
	
	always @ (posedge clk) begin
		if(!flag) begin
			if(sel) segundos <= tempo;
			else segundos <= 0;
			flag <= 1;
		end
		piroquinha <= cont;
		segundim <= segundos;
		cont <= piroquinha + 1;
		if(cont == 26'b01011111010111100001000000) begin
			case(sel)
				0: if(segundos < tempo) segundos <= segundim + 1;
				1: if(segundos > 0) segundos <= segundim - 1;
			endcase
			cont <= 0;
		end
	end

endmodule
