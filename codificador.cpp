#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define tam 10 //tamanho dos bytes enviados

//Completa o vetor recebido com zeros a esquerda ate atingir 8 caracteres
void desloca_direita(char* msgf){
	
	while(strlen(msgf) < tam){
	
	for(int i = strlen(msgf); i>0; i--){
		msgf[i] = msgf[i-1];
	}
	msgf[0] = '0';
	msgf[strlen(msgf)] = '\0';
	}
	msgf[tam] = '\0';
	
	/*printf("%d\n", strlen(msgf));
	for(int i = 0; i < strlen(msgf); i++){
		printf("%d: %c\n", i, msgf[i]);
	}*/
}

// Esta funcao cria um vetor de caracteres de 10 numeros (na forma de char e nao como int)
// Formado respectivamente por: leitura do potenciometro 1 e 2 (0-1023), botao de pausa e botao de reset (0-1)
// a terminacao 'f' no nome de algumas variaveis foi usado para as diferenciarr das variaveis globais
// de nome parecido
void criptografa(char* msgf, int pot1f, int pot2f, int pausef, int resetf){
	int num = resetf + 10*pausef + 100*pot2f + 1000000*pot1f;
	//desloca_direita(msgf);
	itoa(num, msgf, 10);
}

// Separa a string de 8 caracteres em 4 valores numericos inteiros, conferme estavam antes da criptografia
void descriptografa(char* msgf, int* pot1f, int* pot2f, int* pausef, int* resetf){
	*pot1f = 1000*(msgf[0] - '0') + 100*(msgf[1] - '0') + 10*(msgf[2] - '0') + 1*(msgf[3] - '0');
	*pot2f = 1000*(msgf[4] - '0') + 100*(msgf[5] - '0') + 10*(msgf[6] - '0') + 1*(msgf[7] - '0');
	*pausef = (msgf[8] - '0');
	*resetf = (msgf[9] - '0');
}

// O main so foi utilizado para fins de testes
int main()
{
	char msg[tam+1] = {'\0'};		//Inicia um vetor char vazio
	criptografa(msg, 8, 0, 0, 0);
	printf("msg %s\n", msg);
	desloca_direita(msg);
	printf("msg %s\n", msg);
	int pot1, pot2, pause, reset; 
	descriptografa(msg, &pot1, &pot2, &pause, &reset);
	printf("msg %s\n", msg);
	printf("%d, %d, %d, %d\n", pot1, pot2, pause, reset);
}
