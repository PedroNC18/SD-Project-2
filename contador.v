module contador(clk, sel, tempo, aux, pause, reseta, cfg);
	
	input reseta;//input que vai zerar o valor presente no bcd
	input clk; // negocio la
	input sel; // selecao do que vai acontecer (0 : cronometro e 1 : temporizador)
	input [15:0] tempo; // quanto tempo queremos q rode
	input pause;
	input cfg;
	wire reseta;
	
	output [15:0] aux; // o numero que vai estar saindo do contador
	reg[25:0] cont;
	reg [15:0] segundos;
	reg [15:0] aux;

	reg [25:0] piroquinha;
	reg [15:0] segundim;

	reg flag;
	reg flag_aux;
	reg flag2;	
	reg reseta_aux;
	
	
	wire cfg; // teste boladao

	initial begin
		flag2 <= 0;
		flag <= 0;
		flag_aux <= 1;
	end

	always @ (posedge clk) begin
		case(cfg)
			1:begin
				if(flag2 == 0)begin
					flag2 = 1;
					cont <= 0;
					segundos <= 666;
					aux <= 666;
				end
			end		
			0: begin
				if((reseta == flag_aux)) begin
					case(sel)
						0:begin
							segundos <= 16'b000000000000000;
							cont <= 0;
						end	
						1:begin
							segundos <= tempo;
							cont <= 0;
						end
					endcase
				if(flag_aux == 1)flag_aux <= 0;
				if(flag_aux == 0)flag_aux <= 1;
				//reseta_aux <= !reseta_aux;	
				end
				if(!flag) begin
				if(sel) segundos <= tempo;
				else segundos <= 0;
				flag <= 1;
			end
			piroquinha <= cont;
			segundim <= segundos;
			cont <= piroquinha + 1;
			
			if(!pause)aux <= segundos;
			//else aux <= segundos;

			if(cont == 26'b01011111010111100001000000) begin
				case(sel)
					0: if(segundos < tempo) segundos <= segundim + 1;
					1: if(segundos > 0) segundos <= segundim - 1;
				endcase
				cont <= 0;
			end
			flag2 <= 0;
		end
		endcase
	end

endmodule
