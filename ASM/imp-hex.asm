ORG 0x0100

MOV BL,0x5D
 
MOV AH,0x02    ; imprimir caracter na tela quando chamarmos INT 21
MOV DL,BL    ; transfere o conteudo de BL para DL
MOV CL,0x04    ; coloca 4 em CL que sera o contador do deslocamento de bits
 
SHR DL, CL    ; desloca a quantidade apontada em CL de bits a direita no 
              ; registrador DL zerando os bits que ficam na esquerda do deslocamento
			  
ADD DL,0x30    ; Adiciona 30 que eh "ZERO" em hexadecimal na tabela ASCII
CMP DL,0x3A    ; compra com o fim da tabela ASCII para numeros.
              ; O numero 9 termina no hexadecimal 39 depois o proximo é o 3A que não eh mais um numero
			  
JL ImprimePrimeiroDigito	; salta para o segundo digito se a comparacao for menor que 3A ou seja,é menor ou igual a 9.
ADD DL,0x07   ; Se nao fez o salto entao adiciona 7 em DL para para comecar em A na tabela ascii

ImprimePrimeiroDigito:

INT 0x21     ; imprime o primeiro numero

MOV DL,BL     ; transfere o conteudo de BL para DL
AND DL,0x0F    ; Zera o nible mais auto de DL
ADD DL,0x30    ; Adiciona 30 que eh "ZERO" em hexadecimal na tabela ASCII
CMP DL,0x3A    ; compra com o fim da tabela ASCII para numeros.
               ; O numero 9 termina no hexadecimal 39 depois o proximo é o 3A que não eh mais um numero
JL ImprimeSegundoDigito	; salta para o segundo digito se a comparacao for menor que 3A ou seja,é menor ou igual a 9.
ADD DL,0x07    ; Se nao fez o salto entao adiciona 7 em DL para para comecar em A na tabela ascii

ImprimeSegundoDigito:

INT 0x21     ; imprime o segundo numero
INT 0x20    ; termina o programa




			  
