module teclado(clock, colunas, linhas, reg1, reg2, reg3, reg4);

input[3:0]col //as colunas a gente vai ter que variar de acordo com o pulso do clock
output[3:0]line//as linhas nos iremos checar para fazer o cruzamento com as colunas e identificar qual botao foi pressionado
input clk, reset // o input reset eh responsavel por fazer com que a maquina de estados
//volte para o estado inicial que nesse caso é o estado zero
output [3:0] reg1, reg2, reg3, reg4 // Esses quatro registradores serao registradores temporarios que armazenaram separadamente
//os digitos que foram pressionados pelo usuario. Posteriormente, esses registradores se "unirao" em um registrador final
//que representara o numero completo que foi digitado pelo usuario
reg state[1:0] //esse registrador sera o responsavel por armazenar em qual estado da FSM eu me encontro.
//Toda a logica do programa se baseara nele. Nesse caso eu to considerando que os estados sao as colunas que estao sendo avaliadas no momento
parameter zero = 0, one = 1, two = 2, three = 3, four = 4, five = 5

state = 0
always @(state) begin // vai entrar nesse always sempre que houver uma mudanca na variavel state, que representa um estado da minha FSM
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
						end	
				 one:begin //Caso	state seja 1, eu tenho que fazer as colunas ficarem assim 1 0 1 1
						col[0] <= 1
						col[1] <= 0
						col[2] <= 1
						col[3] <= 1
						end
				  two:begin //Caso state seja 2, eu tenho que fazer as colunas ficarem assim 1 1 0 1
						col[0] <= 1
						col[1] <= 1
						col[2] <= 0
						col[3] <= 1
                        end
				   //A terceira coluna nao me interessa pois eu so tenho botoes que representam letras A, B, C, D		
					endcase 

end
always @(negedge line[0] || negedge line[1] || negedge line[2] || negedge line[3])
//Esse always vai ser triggado quando ocorrer uma subida de 0 para 1 em alguma das linhas
//A linha por sua vez "representa" o botão que foi pressionado pelo usuário.
    if(line[0] == 1)begin//Quer dizer que a linha de numero 1 acabou de ser solta
        if(col[0] == 0)begin // 1
            reg1 = 4'b0001 
        end
        if(col[1] == 0)begin // 2
            reg1 = 4'b0010
        end
        if(col[2] == 0)begin // 3
            reg1 = 4'b0011
        end
    end
    if(line[1] == 1)begin//Quer dizer que a linha de numero 2 acabou de ser solta
          if(col[0] == 0)begin //4
            reg1 = 4'b0100 
        end
        if(col[1] == 0)begin //5
            reg1 = 4'b0101
        end
        if(col[2] == 0)begin //6
            reg1 = 4'b0110
        end
    end
    if(line[2] == 1)begin//Quer dizer que a linha de numero 3 acabou de ser solta
          if(col[0] == 0)begin // 7
            reg1 = 4'b0111
        end
        if(col[1] == 0)begin // 8
            reg1 = 4'b1000
        end
        if(col[2] == 0)begin // 9
            reg1 = 4'b1001
        end
    end
    if(line[3] == 1)begin//Quer dizer que a linha de numero 4 acabou de ser solta
        if(col[1] == 0)begin // 0
            reg1 = 4'b0000
        end
        if(col[2] == 0)begin // # vou sinalizar passando o numero 15 para o registrador
            reg1 = 4'b1111
        end
    end
end
always @(negedge clk or negedge reset)//esse always sera o responsavel por de fato realizar a transicao dos estados da maquina de estados do teclado matricial



end


endmodule
