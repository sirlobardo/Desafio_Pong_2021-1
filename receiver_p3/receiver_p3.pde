String com_usada = "/dev/ttyACM0";    //Defina a porta em que o Arduino está conectada
// --- Definindo as Variáveis ---
import processing.serial.*;  // Ativando a comunicação serial entre o Arduino e o Processing
Serial Porta;                // Porta COM que o Arduino está conectado.

// Variáveis para armazenar os valores recebidos pela Serial    
int position[]  = new int[4];  // Vetor para guardar os valores recebidos; o 'new int' foi usado para impedir que o vetor seja inicializado nulo
int pot_left, pot_right, pause, reset;  // Armazenar a posição do jogador na tela.
int height_bar = 200, width_bar = 10; //variaveis para representar altura e largura das barras
float pos_bar1, pos_bar2; //variáveis para representar a posicao das barras
// --- Definindo o void setup() ---
void setup(){
  Porta = new Serial(this, com_usada, 9600);    // Aqui estamos realizando a comunicação serial, troque o "COM4" pela porta COM que você está utilizando
  Porta.bufferUntil('\n');  // As informações que ele irá armazenar vai ser atualizada a cada pular de linha.
  //delay(1000);
  size(1000, 600);
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
    bars_moviment();
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
