import processing.serial.*; //estavelecendo comunicacao com arduino
Serial port; //port = porta em que arduino ira enviar dados 
int[] values; //vetor para receber os valores do arduino
int height_bar = 200, width_bar = 10; //variaveis para representar altura e largura das barras
float pos_bar1, pos_bar2; //variáveis para representar a posicao das barras

void setup(){
  size(1250, 800); // Definindo tamanho da tela de jogo
  port = new Serial(this, "/dev/ttyACM0", 9600); //indicando em que porta o arduino irá enviar os dados
  port.bufferUntil('\n');
  
} 

void draw(){
  background(0);
  bars_moviment();
}

void bars_moviment(){
  //Em primeiro momento é designado as variáveis de posição o retorno da função map
  //Nesta função irá calcular e retornar a posição de cada haste, baseando-se nos valores
  //recebidos do arduino alocados no vetor values[]
  //A função funcionará da seguinte forma
  //map(valor do potenciometro, vmin, vmax, p_min, p_max);
  // vmin e vmax definem o range dos valores de coordenada
  //p_min e p_max definem o range do posicionamento da barra
  pos_bar1 = map(values[0], 0, 1023, 10 + height_bar/2, height-(10 + height_bar/2));
  pos_bar2 = map(values[1], 0, 1023, 10 + height_bar/2, height-(10 + height_bar/2));
  //Colisor
  rectMode(CENTER);//Definindo o centro do corpo
  rect(20+width_bar/2,pos_bar1,width_bar,height_bar,5);
  rect(width-(20+width_bar/2),pos_bar2,width_bar,height_bar,5);
}
