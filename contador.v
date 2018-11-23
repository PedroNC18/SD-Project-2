module contador(clk, sel, tempo, segundos);
	input clk; // negocio la
	input sel; // selecao do que vai acontecer (0 : cronometro e 1 : temporizador)
	input tempo; // quanto tempo queremos q rode
	output segundos; // o numero que vai estar saindo do contador
	reg[25:0] cont;
	reg segundos;
	
	initial begin
		if(sel) segundos <= tempo;
		else segundos <= 0; 
	end
	
	always @ (posedge clk) begin
		cont <= cont + 1;
		if(cont == 26'b10111110101111000010000000) begin
			case(sel)
				0: if(segundos < tempo) segundos <= segundos + 1;
				1: if(segundos > 0) segundos <= segundos - 1;
			endcase
			cont <= 0;
		end
	end

endmodule
