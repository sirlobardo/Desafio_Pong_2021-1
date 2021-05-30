//nao usar print para mensagens, pois isso atrapalha no envio dos dados via Serial

const int pot_left = A0, pot_right = A2;
const int  pause_but = 8, reset_but = 9;  //Botoes de 'pause' e 'reset' 
void setup() {
  pinMode(pot_right, INPUT);
  pinMode(pot_left, INPUT);
  pinMode(reset_but, INPUT_PULLUP);
  pinMode(pause_but, INPUT_PULLUP);
  Serial.begin(9600);
}

void loop() {
  //Leitura analogica dos potenciometros
  int pos_left = analogRead(pot_left);
  int pos_right = analogRead(pot_right);

  //Como os botoes foram ligados em pull_up, o seu estado nao precionado e representado
  //Pela leitura 1. Quando pressionado o valor lido se torna 0.
  //A inversão do valor lido por meio do operador '!' torna o valor mais intuitivo
  int pause = !digitalRead(pause_but);
  int reset = !digitalRead(reset_but);


  //Esse trecho de código cria uma string formada pelos valores lidos separados por '-'
  //E finalizado pelo '\n' do Serial.println()
  //As conversoes dos valores inteiros para os caracteres respectivos se da internamente
  //Na estrutura da String (nao e preciso uma funcao externa para isso)
  String msg = "";  //Cria uma string vazia
  msg += pos_left;
  msg += '-';
  msg += pos_right;
  msg += '-';
  msg += pause;
  msg += '-';
  msg += reset;
  Serial.println(msg);
  //delay(10);
}

/*int read_bar_right(){
  int pos_right = analogRead(pot_right);
  //Serial.println(pos_right)
  return pos_right;
}

int read_bar_left(){
  int pos_left = analogRead(pot_left);
  //Serial.println(pos_left)
  return pos_left;
}*/
