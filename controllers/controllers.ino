//nao usar print para mensagens, pois isso atrapalha no envio dos dados via Serial
#define tam 10 //tamanho dos bytes enviados

const int pot_left = A0, pot_right = A2;
const int  pause_but = 9, reset_but = 10;  //Botoes de 'pause' e 'reset' 
void setup() {
  pinMode(pot_right, INPUT);
  pinMode(pot_left, INPUT);
  pinMode(reset_but, INPUT_PULLUP);
  pinMode(pause_but, INPUT_PULLUP);
  Serial.begin(9600);
  //Serial.println("Começando...");
  delay(1000);
}

void loop() {
  char msg[tam+1] = {'\0'}; //Inicia um vetor char vazio
  
  int pos_left = analogRead(pot_left);
  int pos_right = analogRead(pot_right);
  int pause = !digitalRead(pause_but);
  int reset = !digitalRead(reset_but);
 
  criptografa(msg, pos_left, pos_right, pause, reset);
  desloca_direita(msg);
  Serial.write(msg);
}

int read_bar_right(){
  int pos_right = analogRead(pot_right);
  //Serial.println(pos_right)
  return pos_right;
}

int read_bar_left(){
  int pos_left = analogRead(pot_left);
  //Serial.println(pos_left)
  return pos_left;
}

// Completa o vetor de caracteres com zeros a esquerda ate que seu tamanho atinja 10 caracteres
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
  int num = resetf + 10*pausef + 100*pot2f + 100000*pot1f;
  //desloca_direita(msgf);
  itoa(num, msgf, 10);
}
