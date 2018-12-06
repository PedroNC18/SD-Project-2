module main(clk, a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2, a3, b3, c3, d3, e3, f3, g3, a4, b4, c4, d4, e4, f4, g4, sel, 
	pause, cfg, reseta, in, out, teste, teste1, teste2,mechuper);
	
	input [3:0]in;
	input clk;
	input sel;
	input cfg;
	input pause;
	input reseta;// vai ser o responsavel por zerar o valor do bcd
	output teste1;
	output teste2; //L
	output mechuper;
	output a1, b1, c1, d1, e1, f1, g1;
	output a2, b2, c2, d2, e2, f2, g2;
	output a3, b3, c3, d3, e3, f3, g3;  //ok
	output a4, b4, c4, d4, e4, f4, g4;
	output teste;
	output [3:0]out;
	
	/* registradores responsaveis por armazenar os vetores de 16 bits */

	reg pp;
	reg rr;
	reg[15:0] registrador_w_aa;
	wire[15:0] registrador_w; //ok
	wire[15:0] resposta;
	
	
	initial begin
		registrador_w_aa <= 16'b1001100110011001; //valor teste
		pp <= 1'b0;
		rr <= 1'b0;
	end
	
	always @(negedge pause) begin
		pp = ~pp;
	end
	always @(negedge reseta) begin
		rr = ~rr;
	end
	
	assign registrador_w = registrador_w_aa;
	teclado2 keyboard(clk, in, out, registrador_w, teste, teste1, teste2,mechuper);
	/*conversaobin_dec cbd(registrador_w, registrador_dec_w);
	contador cnt(clk, sel, registrador_dec_w, registrador_aux_w, pp, rr, cfg);
	conversaodec_bin cdb(registrador_aux_w, resposta);
	bcd a(resposta, a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2,
	a3, b3, c3, d3, e3, f3, g3, a4, b4, c4, d4, e4, f4, g4);
	*/
	//assign registrador_w = registrador_w_aa;
	/* registrador que armazena o 'numero decimal' */
	wire[15:0] registrador_dec_w;

	/* registradores responsaveis por armazenar um decimal (que eh o tempo atual do contador) */
	wire[15:0] registrador_aux_w;

	/* sel = 0 -> contador */
	/* sel = 1 -> temporizador */

	/* codigo */
	// funcao pra receber os dados do teclado //
	
	/* codigo */
endmodule
