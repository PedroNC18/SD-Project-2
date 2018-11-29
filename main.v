module main(clk, a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2, a3, b3, c3, d3, e3, f3, g3, a4, b4, c4, d4, e4, f4, g4);
	input clk;
	output a1, b1, c1, d1, e1, f1, g1;
	output a2, b2, c2, d2, e2, f2, g2;
	output a3, b3, c3, d3, e3, f3, g3;
	output a4, b4, c4, d4, e4, f4, g4;

	/* registradores responsaveis por armazenar os vetores de 16 bits */
	reg[15:0] registrador_w_aa;
	wire[15:0] registrador_w;
	wire[15:0] resposta;
	wire[15:0] fiogamb;
	
	reg[15:0] ajudinha;
	
	initial begin
		registrador_w_aa <= 16'b1001100110011001;
	end
	assign registrador_w = registrador_w_aa;
	/* registrador que armazena o 'numero decimal' */
	wire[15:0] registrador_dec_w;

	/* registradores responsaveis por armazenar um decimal (que eh o tempo atual do contador) */
	wire[15:0] registrador_aux_w;

	/* fio wire para o seletor */
	wire sel;
	
	/* sel = 0 -> contador */
	/* sel = 1 -> temporizador */
	assign sel = 1;

	/* codigo */
	// funcao pra receber os dados do teclado //
	conversaobin_dec cbd(registrador_w, registrador_dec_w);
	contador cnt(clk, sel, registrador_dec_w, registrador_aux_w);
	conversaodec_bin cdb(registrador_aux_w, resposta);
	
	bcd a(resposta, a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2,
	a3, b3, c3, d3, e3, f3, g3, a4, b4, c4, d4, e4, f4, g4);
	/* codigo */

endmodule
