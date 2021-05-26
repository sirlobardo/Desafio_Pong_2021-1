#include<stdio.h>
#include<stdlib.h>

// Esta funcao cria um vetor de caracteres de 8 numeros (na forma de char e nao como int)
// Formado respectivamente por: leitura do potenciometro 1 e 2 (0-255), botao de pausa e botao de reset (0-1)
void criptografa(char* msg, int pot1, int pot2, int pause, int reset){
	int num = reset + 10*pause + 100*pot2 + 100000*pot1;
	itoa(num, msg, 10);
}

int main()
{
	char msg[9];
	criptografa(msg, 127, 45, 0, 1);
	printf("%s\n", msg);
	//printf("%d\n", 127*100);
}
