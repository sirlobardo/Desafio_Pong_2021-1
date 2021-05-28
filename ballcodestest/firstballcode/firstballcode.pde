import processing.seria.*;// ativa a comunicação serial entre o Arduino e o Processing
Serial Porta; //Porta /dev/ttyUSB0 que o Arduino está conectado


int[] position; //Vetor que controla cada posição dos potenciômeros
int high_bar = 100; // Altura da haste
int width_bar = 20; // Largura da haste
int size_ball = 15; //Tamanho da bola


float pos_pot1,pos_pot2;//Armazenar a posição do jogador na tela
float x,y, sp_x, sp_y;// Variaveis para trabalhar com as coordenadas e velocidades da bola em cada eixo
float init_x,init_y; //Coordenadas iniciais de X e Y

int bounce; //Variável para saber quando a tela está rebatendo nas bordas e nas hastes

void ball() {
  fill(255);
  stroke(255);
  ellipse(x,y,size_ball,size_ball);
  //Determina a tragetória linear da bola
  x = x + sp_x;
  y = y + sp_y;
  
  
  //if((sp_x<0 && x<20 + 
  
  
  
  
  
  
  
  
  
}
