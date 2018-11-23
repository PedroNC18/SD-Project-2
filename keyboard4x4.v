//Nesse modulo do teclado falta tratar duas coisas:
//1. Fazer o tratamento para o debouncing: Estabilizar o botão após ele ter sido pressionado
//2. Fazer o tratamento para quando o usuário pressiona uma tecla e segura essa tecla por um dado intervalo de tempo
module teclado(clk, in, out, num)
//Parte das entradas e das saídas.
input clk
input [3:0]in
output reg[3:0]out
output reg[3:0]num //Esse registrador vai guardar o numero que foi armazenado pelo usuario em um dado momento
//Parte responsável pela transicao dos estados
reg[1:0]state //Estado atual em que eu me encontro
reg[1:0]nextstate //Prox estado para o qual eu irei na minha maquina de estados

always @(posedge clk)begin//Logica sequencial do modulo. Ela é responsável pela transição dos estados
  state <= nextstate
end

always @(*)begin//Logica combinacional do modulo. Ela é responsável por realizar as operações
//caracteristicas de cada estado
  case(state)begin
    0:begin
        out <= 4'b0111 //Aqui eu to variando a coluna mas ela é considerada uma saida do ponto de vista
        //do FPGA
        nextstate <= 1 //transicao do estado 0 para o estado 1
        case(in)begin
            4'b0111: begin
                num <= 1
            end
            4'b1011: begin
                num <= 4
            end
            4'b1101: begin
                num <= 7
            end
            default: begin //nessa situacao temos que o cara pode ter pressionado o botão de *.
            //como esse botão nem serve pra nada, então fodac
                num <= 4'b1111 //o numero 15 serve pra indicar quando essa situação acontece       
            end
          end  
        endcase
    end
    1:begin
        out <= 4'b1011 // coluna
        nextstate <= 2
        case(in)begin
            4'b0111: begin
                num <= 2
            end
            4'b1011: begin
                num <= 5
            end
            4'b1101: begin
                num <= 8
            end
            4'b1110: begin
                num <= 0
            end
          end
        endcase
    end
    2:begin
        out <= 4'b1101 // coluna
        nextstate <= 3
        case(in)begin
            4'b0111: begin
                num <= 3
            end
            4'b1011: begin
                num <= 6
            end
            4'b1101: begin
                num <= 9
            end
            4'b1110: begin
                num <= 10 //indicador de que o usuário apertou o botão de #
            end
          end
        endcase
    end
    3:begin
        out <= 4'b1110 //coluna
        //Nao importa o valor de qualquer linha. Os botões dessa coluna sao irrelevantes
        nextstate <= 0
        num <= 4'b1111 //numero 15
    end                                                    
end
endmodule

module delayclock(clk, deg_clk)
    input clk
    output deg_clk
    reg aux
    initial begin
        aux = 0
    end    
    always @(posedge clk)begin
        aux <= aux + 1
        if(aux == 500000)begin
            aux <= 0
            deg_clk = ~deg_clk
        end
    end
endmodule
