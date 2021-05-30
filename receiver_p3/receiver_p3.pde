String com_usada = "/dev/ttyUSB0";    //Defina a porta em que o Arduino está conectada
// --- Definindo as Variáveis ---
import processing.serial.*;  // Ativando a comunicação serial entre o Arduino e o Processing
Serial Porta;                // Porta COM que o Arduino está conectado.

// Variáveis para armazenar os valores recebidos pela Serial    
int position[]  = new int[4];  // Vetor para guardar os valores recebidos; o 'new int' foi usado para impedir que o vetor seja inicializado nulo
int pot_left, pot_right, pause, reset;  // Armazenar a posição do jogador na tela.
int height_bar = 200, width_bar = 10; //variaveis para representar altura e largura das barras
float pos_y_bar1, pos_y_bar2, pos_x_bar1, pos_x_bar2; //variáveis para representar a posicao das barras
int size_ball = 10; //Tamanho da bola
float x,y, sp_x, sp_y;// Variaveis para trabalhar com as coordenadas e velocidades da bola em cada eixo
int bounce; //Variável para saber quando a tela está rebatendo nas bordas e nas hastes
        
float init_x,init_y;// Variáveis para trabalhar com as coord da bola na tela.
boolean start = true;
boolean init_start = true;
boolean pausar = false;
int points_1 = 0, points_2 = 0;
// --- Definindo o void setup() ---
void setup(){
    Porta = new Serial(this, com_usada, 9600);    // Aqui estamos realizando a comunicação serial, troque o "COM4" pela porta que você está utilizando
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
    pause = position[2];
    reset = position [3];
    //pause = position[2];
    //reset = position[3];
   //println(position[0], " ",position[1], " ",position[2], " ",position[3]);

    
  

      // Quando a pessoa iniciar o jogo, acontece tudo que está dentro do if
  if(start){
    textSize(100);
    background(0);
    // Função que desenha o campo de jogo na tela.
    fill(255);
  
    if(init_start){  // Local onde a bola deve iniciar na tela.
      x = init_x;
      y = init_y;
      sp_x = random(2,3)*rnd_sign();
      sp_y = random(2,3)*rnd_sign();
      bounce = 0;
      init_start = !init_start;
    }
    
    scoreboard();
    // posicionamento dos jogadores
    //posiziona_pad();
    bars_moviment();
    // movimentação da bola
    ball();
    println(sp_x, sp_y);
    
    }
    
// função dos pushbuttons
  if(position[2] == 1 && start){
       pausar = !pausar;
       sp_x = 0;
       sp_y = 0;
/*if(position[2] == 1 && pausar == true){
       x = x + sp_x;
       y = y + sp_y;
       
       
       }*/
       
       
      }
      
    
  if(position[3] == 1 && start) {
      init_start = !init_start;
      points_1 = 0;
      points_2 = 0;
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
  //vmin e vmax definem o range dos valores de coordenada
  //p_min e p_max definem o range do posicionamento da barra
  //no final a função map retorna um float que irá definir em que posição a barra deve ser impressa na tela.
  pos_y_bar1 = map(pot_left, 0, 1023, 10 + height_bar/2, height-(10 + height_bar/2));
  pos_y_bar2 = map(pot_right, 0, 1023, 10 + height_bar/2, height-(10 + height_bar/2));
  //
  rectMode(CENTER);//Definindo o centro do corpo
  pos_x_bar1 = 10 + width_bar;
  pos_x_bar2 = width - pos_x_bar1;
  //rect(posição no eixo x, posição no eixo y,  largura, altura, "arrendodamento")
  rect(pos_x_bar1, pos_y_bar1, width_bar, height_bar, 50);
  rect(pos_x_bar2, pos_y_bar2, width_bar, height_bar, 50);
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
  if((sp_x<0 &&x<20+width_bar+size_ball/2 && x>20+width_bar/2 && y>=pos_y_bar1-height_bar/2 && y<=pos_y_bar1 + height_bar/2) || (sp_x>0 && x>width-(20+width_bar+size_ball/2) && x<width-(20+width_bar/2) && y>=pos_y_bar2-height_bar/2 && y<=pos_y_bar2+height_bar/2)){
    if(bounce<20){
      sp_x = -1.15*sp_x;
      bounce++;
      println("bounce");
    }
    else{
      sp_x = -sp_x;
      
      }
  }
  int var = check();
  if(var != 0) score(var);

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

int check(){
  // a função confere tem o objetivo de verificar se a bola ainda está dentro do campo.
  // Utilizando a variável x que possui a posição da bola no eixo horizontal podemos verificar se a bola passou por uma das barras da seguinte forma:
  // Comparando as variáveis com a posição das hastes no eixo x (que não é alterada em nenhum momento durante a partida), caso ela seja maior 
  // no caso da haste da direita(pos_x_bar2), ou menor no caso da haste da esquerda(pos_x_bar1)
  // podemos retornar um valor e definir quem deve receber a pontuação ou apenas continuar o jogo.
  
  if(x < pos_x_bar1) return -1;
  else if(x > pos_x_bar2) return 1;
  else return 0;
  
}

void score(int var){
 if (var == -1){
   points_1++;
  }
  else if(var == 1){
   points_2++;
  }
  x = width/2;
  y = height/2;
}

void scoreboard(){
  text(points_1,(width/2)+100,100);
  text(points_2,(width/2)-100,100);
}
//Funcão sem funcionar ainda
/*
void Pushbuttons(){
  if(pause == 1 && start){
   init_start = false; 
  }
  if(reset == 1 && start) {
    start = !start;
    start = true;
  }
  
}*/
