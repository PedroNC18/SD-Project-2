module main(clk, a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2, a3, b3, c3, d3, e3, f3, g3, a4, b4, c4, d4, e4, f4, g4);
	input clk;
	output a1, b1, c1, d1, e1, f1, g1;
	output a2, b2, c2, d2, e2, f2, g2;
	output a3, b3, c3, d3, e3, f3, g3;
	output a4, b4, c4, d4, e4, f4, g4;

	/* registradores responsaveis por armazenar os vetores de 16 bits */
	wire[15:0] registrador_w;

	/* registrador que armazena o 'numero decimal' */
	wire registrador_dec_w;
	
	/* registradores responsaveis por armazenar um decimal (que eh o tempo atual do contador) */
	wire registrador_aux_w;
	
	/* fio wire para o seletor */
	wire sel;

	/* partes de teste */
	assign sel = 0;
	/* partes de teste */

	/* codigo */
	// funcao pra receber os dados do teclado //
	conversaobin_dec cbd(registrador_w, registrador_dec_w);
	contador cnt(clk, sel, registrador_dec_w, registrador_aux_w);
	conversaodec_bin cdb(registrador_aux_w, registrador_w);
	
	bcd a(registrador_w, a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2,
	a3, b3, c3, d3, e3, f3, g3, a4, b4, c4, d4, e4, f4, g4);
	/* codigo */

endmodule
