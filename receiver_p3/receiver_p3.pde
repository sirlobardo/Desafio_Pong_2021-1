String com_usada = "/dev/ttyUSB0";    //Defina a porta em que o Arduino está conectada
//String com_usada = "COM3";

// --- Definindo as Variáveis ---
import processing.serial.*;  // Ativando a comunicação serial entre o Arduino e o Processing
Serial Porta;                // Porta COM que o Arduino está conectado.

// Variáveis para armazenar os valores recebidos pela Serial    
int position[]  = new int[4];  // Vetor para guardar os valores recebidos; o 'new int' foi usado para impedir que o vetor seja inicializado nulo
int pot_left, pot_right, pause, reset;  // Armazenar a posição do jogador na tela.

// Variáveis para as barras
int height_bar = 200, width_bar = 10; //variaveis para representar altura e largura das barras
float pos_y_bar1, pos_y_bar2, pos_x_bar1, pos_x_bar2; //variáveis para representar a posicao das barras

// Variáveis para abola
int size_ball = 10; //Tamanho da bola
float x,y, sp_x, sp_y;// Variaveis para trabalhar com as coordenadas e velocidades da bola em cada eixo
int bounce; //Variável para saber quando a tela está rebatendo nas bordas e nas hastes
        
float init_x,init_y;// Variáveis para trabalhar com as coord da bola na tela.

//Jogar para encontrar valores ideias
int angulos[] = {90, 60, 50, 40};  //Angulos de rebatimento, ordenados do centro para as bordas

// Variáveis de estado do jogo
boolean start = true;
boolean init_start = true;
boolean pausar = false;
int points_1 = 0, points_2 = 0;
int ant_pause;

// --- Definindo o void setup() ---
void setup(){
  Porta = new Serial(this, com_usada, 9600);    // Aqui estamos realizando a comunicação serial, troque o "COM4" pela porta que você está utilizando
  Porta.bufferUntil('\n');  // As informações que ele irá armazenar vai ser atualizada a cada pular de linha.
  //delay(1000);
  size(1000, 600);
  init_x = width/2;   // Coordenada inicial X centralizada no meio
  init_y = height/2;
  delay(1100); //Tempo de conexão entre o Arduino e o processing (neese instervalo ele só recebe 0)
}

// --- Definindo o void draw() ---
void draw(){
    
    background(0, 95, 96);
    noCursor();
    // 1 1 1 1 1
    //Salva os valores recebidos nas suas respectivas variaves(globais)
    //Caso rde um erro o 'Try' impede que o código 'trave'
    ant_pause = pause;
    try{
      pot_left = position[0];
      pot_right = position[1];
      pause = position[2];
      reset = position [3];
      //println(position[0], " ",position[1], " ",position[2], " ",position[3]);
    } catch (NullPointerException e){
      e.printStackTrace();  //Mensagem de erro
    } catch (ArrayIndexOutOfBoundsException e){
      e.printStackTrace();  //Mensagem de erro
    }
    
    
    Pushbuttons();
   
if(!pausar){ 
      // Quando a pessoa iniciar o jogo, acontece tudo que está dentro do if
  if(start){
    textSize(100);
    background(0, 95, 96);
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
    bars_moviment();
    // movimentação da bola
    ball();
    println(sp_x, sp_y);
    
    }
    
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

float speedx, speedy; 
void ball() {
  fill(255);
  stroke(255);
  ellipse(x,y,size_ball,size_ball);
  
  //Determina a tragetória linear da bola
  x = x + sp_x;
  y = y + sp_y;
  //if(sp_x!=0)speedx = sp_x;
  //if(sp_y!=0)speedy = sp_y;
  //Colidir com os lados superior e inferior do campo
  if(y<10+size_ball/2 || y>height - (10+size_ball/2)){ // se y<15 ou se y>600 - 15 velocidade contrária
  sp_y = -sp_y; 
      //if(sp_y!=0)speedy = sp_y;
  }
  //colidir com as hastes  
  // Se (velocidade no eixo x<0 e x<20+largura da haste + metade da bola e x>20+metade da 
  //largura da haste e y>= a metade da posição da haste no eixo y e y <= a posição da 
  //haste no eixo y + metade da altura da haste)
  //OU
  // Se (velocidade no eixo x>0 e x>largura da tela - (20 + largura da haste + metade da 
  //bola) e x<largura da tela - (20 + metade da largura da barra) e y>=posição da haste2  
  //no eixo y - metade da altura da haste e y<=posição da haste2 no eixo y + metade da 
  //altura da haste 
  if((sp_x<0 && x<20+width_bar+size_ball/2 && x>20+width_bar/2 && y>=pos_y_bar1-height_bar/2 && y<=pos_y_bar1 + height_bar/2) || (sp_x>0 && x>width-(20+width_bar+size_ball/2) && x<width-(20+width_bar/2) && y>=pos_y_bar2-height_bar/2 && y<=pos_y_bar2+height_bar/2)){
    if(bounce<20){                                                    
      ball_spd_angular(sp_x, sp_y);
      sp_x = 1.15*sp_x;
      //if(sp_x!=0)speedx = sp_x;
      bounce++;
      println("bounce");
    }
    else{
      //sp_x = -sp_x;
      //if(sp_x!=0)speedx = sp_x;
      }
  }
  int var = check();
  if(var != 0) score(var);

}

//Retorna +1 se o numero for positivo ou zero
//Retorna -1 se o numero for negativo
int positive_or_negative(float num){
  if(num < 0)
    return -1;
  else
    return 1;
}


// Essa função divide cada barra em 8 segmentos e identifica em qual deles ocorreu a colisão
// Os angulos correspondentes se encontram no vetor angulos[]
// Sua lógica de funcionamento parte do princípio de conservação da energia: a velocidade (em módulo) antes
// e após a colisão deve ser a mesma. Logo, a mudança do angulo ocorre na variação dos valores de velocidade
// x e y, obtidos através de um triângulo retângulo
void ball_spd_angular(float ant_sp_x, float ant_sp_y){
  
  float modulo = sqrt(pow(ant_sp_x, 2) + pow(ant_sp_y, 2));   //Modulo da velocidade anterior
  if(sp_x<0){            //Barra da esquerda
    if(y>=pos_y_bar1-height_bar/8 && y<=pos_y_bar1 + height_bar/8){
      //(2 segmentos centrais)
      sp_y = cos(radians(angulos[0])) * modulo;
      sp_x = sin(radians(angulos[0])) * modulo;
    } else if(y>=pos_y_bar1 - height_bar*2/8 && y<=pos_y_bar1 + height_bar*2/8){
      //(1 segmento acima e outro abaixo do central)
      sp_x = cos(radians(angulos[1])) * modulo; 
      sp_y = sin(radians(angulos[1])) * modulo;
    } else if(y>=pos_y_bar1 - height_bar*3/8 && y<=pos_y_bar1 + height_bar*3/8){
      //(2 segmentos acima e abaixo do central)
      sp_x = cos(radians(angulos[2])) * modulo;
      sp_y = sin(radians(angulos[2])) * modulo;
    } else if(y>=pos_y_bar1 - height_bar*4/8 && y<=pos_y_bar1 + height_bar*4/8){
      //(segmentos das bordas da barra)
      sp_x = cos(radians(angulos[3])) * modulo; 
      sp_y = sin(radians(angulos[3])) * modulo;
    }
    
    sp_y = positive_or_negative(ant_sp_y) * sp_y;    //'Recupera' o sinal inicial da velocidade y, já que todos os valores dos calculos são sempre positivos
  } else if (sp_x>0){    //Barra da direita
    if(y>=pos_y_bar2-height_bar/8 && y<=pos_y_bar2 + height_bar/8){
      //(2 segmentos centrais)
      sp_y = cos(radians(angulos[0])) * modulo;
      sp_x = sin(radians(angulos[0])) * modulo;
    } else if(y>=pos_y_bar2 - height_bar*2/8 && y<=pos_y_bar2 + height_bar*2/8){
      //(1 segmento acima e abaixo do central)
      sp_x = cos(radians(75)) * modulo;
      sp_y = sin(radians(75)) * modulo;
    } else if(y>=pos_y_bar2 - height_bar*3/8 && y<=pos_y_bar2 + height_bar*3/8){
      //(2 segmentos acima e abaixo do central)
      sp_x = cos(radians(60)) * modulo;
      sp_y = sin(radians(60)) * modulo;
    } else if(y>=pos_y_bar2 - height_bar*4/8 && y<=pos_y_bar2 + height_bar*4/8){
      //(segmentos das bordas da barra)
      sp_x = cos(radians(45)) * modulo;  
      sp_y = sin(radians(45)) * modulo;
    }
    
    sp_x = -sp_x;   //Deve ser negativo para inverter o sentido da bola (em direção ao lado esquerdo do campo)
    sp_y = positive_or_negative(ant_sp_y) * sp_y;    //'Recupera' o sinal inicial da velocidade y, já que todos os valores dos calculos são sempre positivos
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
// função dos pushbuttons
void Pushbuttons(){
  
  if(reset == 1 && start) {
      init_start = !init_start;
      points_1 = 0;
      points_2 = 0;
      
  }
   if(pause == 1 && start){
     if(pause != ant_pause){
       pausar = !pausar;
     }
    }
    if(pausar == true){
     String x = "Pause";
     textSize(100);
     text(x, 350, 330);
   }
      
   
  
}
