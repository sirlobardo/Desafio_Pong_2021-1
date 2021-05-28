String com_usada = "/dev/ttyUSB0";    //Defina a porta em que o Arduino está conectada
// --- Definindo as Variáveis ---
import processing.serial.*;  // Ativando a comunicação serial entre o Arduino e o Processing
Serial Porta;                // Porta COM que o Arduino está conectado.

// Variáveis para armazenar os valores recebidos pela Serial    
int position[]  = new int[4];  // Vetor para guardar os valores recebidos; o 'new int' foi usado para impedir que o vetor seja inicializado nulo
int pot_left, pot_right, pause, reset;  // Armazenar a posição do jogador na tela.
int height_bar = 200, width_bar = 10; //variaveis para representar altura e largura das barras
float pos_bar1, pos_bar2; //variáveis para representar a posicao das barras
int size_ball = 10; //Tamanho da bola
float x,y, sp_x, sp_y;// Variaveis para trabalhar com as coordenadas e velocidades da bola em cada eixo
int bounce; //Variável para saber quando a tela está rebatendo nas bordas e nas hastes
        // Variáveis para trabalhar com as coord da bola na tela.
float init_x,init_y;
boolean start = true;
boolean init_start = true;
// --- Definindo o void setup() ---
void setup(){
  Porta = new Serial(this, com_usada, 9600);    // Aqui estamos realizando a comunicação serial, troque o "COM4" pela porta COM que você está utilizando
  Porta.bufferUntil('\n');  // As informações que ele irá armazenar vai ser atualizada a cada pular de linha.
  //delay(1000);
  size(1000, 600);
  init_x = width/2;   // Coordenada inicial X centralizada no meio
  init_y = height/2;
  
}

// --- Definindo o void draw() ---
void draw(){
    //Salva os valores recebidos nas suas respectivas variaves(globais)
    background(0);
    noCursor();
    pot_left = position[0];
    pot_right = position[1];
    //pause = position[2];
    //reset = position[3];
    //println(position[0], " ",position[1], " ",position[2], " ",position[3]);
    
    
      // Quando a pessoa iniciar o jogo, acontece tudo que está dentro do if
  if(start){
    textSize(100);
    background(0);
    // Função que desenha o campo de jogo na tela.
    fill(255);
    // Função para mostrar o placar na tela.
    
    if(init_start){  // Local onde a bola deve iniciar na tela.
      x = init_x;
      y = init_y;
      sp_x = random(2,3)*rnd_sign();
      sp_y = random(2,3)*rnd_sign();
      bounce = 0;
      init_start = !init_start;
    }
    
    // posicionamento dos jogadores
    //posiziona_pad();
    bars_moviment();
    // movimentação da bola
    ball();
    }
    
}


// Essa funcao e chamada automaticamente quando ha informacoes disponiveis no Serial
// Recebe os valores enviado pelo arduino via serial. A quebra de linha indica o fim do conjuto de dados
// e o '-' separa um valor numerico do outro. O resultado é armazenado em variaveis globais
// padrão de envio: pot1-pot2-pause-reset\n

void serialEvent (Serial Porta) {
  String msg = Porta.readStringUntil('\n');  //Continuara lendo ate encontrar a quebra de linha
 
  if (msg != null) {
    
    // trim = função que remove os espaços VAZIOS
    msg = trim(msg);
    
    // Salva os dados na forma de inteiros
    position = int(split(msg,'-'));    //Retorna um vetor formado pela separacao da string em palavras marcadas pelo '-'
    
    //println(msg);
  }
}

void bars_moviment(){
  //Em primeiro momento é designado as variáveis de posição o retorno da função map
  //Nesta função irá calcular e retornar a posição de cada haste, baseando-se nos valores
  //recebidos do arduino alocados no vetor values[]
  //A função funcionará da seguinte forma
  //map(valor do potenciometro, vmin, vmax, p_min, p_max);
  // vmin e vmax definem o range dos valores de coordenada
  //p_min e p_max definem o range do posicionamento da barra
  pos_bar1 = map(pot_left, 0, 1023, 10 + height_bar/2, height-(10 + height_bar/2));
  pos_bar2 = map(pot_right, 0, 1023, 10 + height_bar/2, height-(10 + height_bar/2));
  //Colisor
  rectMode(CENTER);//Definindo o centro do corpo
  rect(20+width_bar/2,pos_bar1,width_bar,height_bar,5);
  rect(width-(20+width_bar/2),pos_bar2,width_bar,height_bar,5);
}


void ball() {
  fill(255);
  stroke(255);
  ellipse(x,y,size_ball,size_ball);
  //Determina a tragetória linear da bola
  x = x + sp_x;
  y = y + sp_y;
  
  //Colidir com os lados superior e inferior do campo
  if(y<10+size_ball/2 || y>height - (10+size_ball/2)) sp_y = -sp_y; // se y<15 ou se y>600 - 15 velocidade contrária
  
  
  //colidir com as hastes  
  if((sp_x<0 &&x<20+width_bar+size_ball/2 && x>20+width_bar/2 && y>=pos_bar1-height_bar/2 && y<=pos_bar1 + height_bar/2) || (sp_x>0 && x>width-(20+width_bar+size_ball/2) && x<width-(20+width_bar/2) && y>=pos_bar2-height_bar/2 && y<=pos_bar2+height_bar/2)){
    if(bounce<20){
      sp_x = -1.5*sp_x;
      bounce++;
    }
    else{
      sp_x = -sp_x;
      
    }
  }
}

// Função que controla o sentido de movimentação da bola no inicio do jogo.
float rnd_sign(){
  float n = random(-1,1);
  if(n>=0){
    return 1.0;
  }
  else{
    return -1.0;
  }
}
