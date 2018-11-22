module teclado(clock, colunas, linhas, reg1, reg2, reg3, reg4);

input[3:0]col //as colunas a gente vai ter que variar de acordo com o pulso do clock
output[3:0]line//as linhas nos iremos checar para fazer o cruzamento com as colunas e identificar qual botao foi pressionado
input clk
output [3:0] reg1, reg2, reg3, reg4 // Esses quatro registradores serao registradores temporarios que armazenaram separadamente
//os digitos que foram pressionados pelo usuario. Posteriormente, esses registradores se "unirao" em um registrador final
//que representara o numero completo que foi digitado pelo usuario
reg state[1:0] //esse registrador sera o responsavel por armazenar em qual estado da FSM eu me encontro.
//Toda a logica do programa se baseara nele. Nesse caso eu to considerando que os estados sao as colunas que estao sendo avaliadas no momento
parameter zero = 0, one = 1, two = 2, three = 3, four = 4, five = 5

state = 0
always @(negedge clk) begin
		case(state)
				zero:begin //Caso state seja 0, eu tenho que fazer as colunas ficarem assim: 0 1 1 1
						col[0] <= 0
						col[1] <= 1
						col[2] <= 1
						col[3] <= 1
						//-------
						//------- DUVIDA NUMERO 1 ---- : EU TENHO QUE SABER EM QUAL DIGITO EU ESTOU NO MOMENTO(PRIMEIRO,SEGUNDO,TERCEIRO,QUARTO) PARA PODER GUARDAR NO REG CORRETO 
						//COMO FAZER ISSO? ---------
						//------
						//-------
						//------- DUVIDA NUMERO 2 ---- : EU TENHO QUE SABER EM QUAL MOMENTO A TECLA FOI LIBERADA PARA FAZER O TRATAMENTO DO DEBOUNCER. 
						//COMO FAZER ISSO? ---------
						//------
						//Agora eu tenho que checar pra ver se tem cruzamento com alguma linha
						if(line[0] == 0)//nesse caso temos que o 1 foi pressionado
							reg1 = 4'b0001
						if(line[1] == 0)//nesse caso temos que o 4 foi pressionado
							reg1 = 4'b0100
						if(line[2] == 0)//o numero 7 foi pressionado
							reg1 = 4'b0111
						//O botao de asterisco eh irrelevante
						state = one //TRANSICAO PARA O PROXIMO ESTADO/COLUNA
						end	
				 one:begin //Caso	state seja 1, eu tenho que fazer as colunas ficarem assim 1 0 1 1
						col[0] <= 1
						col[1] <= 0
						col[2] <= 1
						col[3] <= 1
						if(line[0] == 0)//pressionei o numero 2
							reg1 = 4'b0010
						if(line[1] == 0)//pressionei o numero 5
							reg1 = 4'b0101
						if(line[2] == 0)//pressionei o numero 8
							reg1 = 4'b1000
						if(line[3] == 0)//pressionei o numero 0
							reg1 = 4'b0000
						state = two //TRANSICAO PARA O PROXIMO ESTADO/COLUNA
						end
				  two:begin //Caso state seja 2, eu tenho que fazer as colunas ficarem assim 1 1 0 1
						col[0] <= 1
						col[1] <= 1
						col[2] <= 0
						col[3] <= 1
						if(line[0] == 0)//pressionei o numero 3
							reg1 = 4'b0011
						if(line[1] == 0)//pressionei o numero 6
							reg1 = 4'b0101
						if(line[2] == 0)//pressionei o numero 9
							reg1 = 4'b1001
						if(line[3] == 0)//pressionei o hashtag # (OU SEJA, confirmei ja o numero que eu digitei)
							reg1 = 4'b1111 // TO COLOCANDO O NUMERO 15 COMO UM INDICADOR DE QUE O BOTAO # FOI PRESSIONADO
						state = zero //TRANSICAO PARA O PROXIMO ESTADO/COLUNA
						//Nesse caso em particular a gente volta para primeira coluna col[0] ja que col[3] eh irrelevante
						end
				   //A terceira coluna nao me interessa pois eu so tenho botoes que representam letras A, B, C, D		
					endcase 

end
