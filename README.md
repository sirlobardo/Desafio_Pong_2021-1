# Desafio Pong - 2021.1

## Introdução
![banner](https://github.com/GabrielCalmon/Desafio_Pong_2021-1/blob/main/resources/banner.PNG?raw=true)

Este repositório foi criado para o desenvolvimento do desafio da AV3 da disciplina **Sistemas Embarcados** referente ao período letivo de 2021.1.

O desafio consistia na criação de um jogo inspirado no Pong com a interface gráfica desenvolvida no Processing 3 e empregando um Arduino, botões e potenciômetros para construção do hardware.

## Organização
A organização das pastas é a seguinte:

- `controller` - Contém o código com extensão *.ino* que deve ser carregado no Arduino.

- `paper` - Contém os arquivos necessários ao *Latex* para geração do artigo. 
  
- `resources` - Arquivos de suporte geral ao repositório, bem como o arquivo *Critérios_PONG.pdf* com os critérios para o pleno cumprimento do desafio.

- `receiver_p3` - Contém o código do *Processing 3* e seus arquivos de apoio (fonte das letras e trilha sonora).

## Instalação
Para execução do jogo na sua máquina siga o passo-a-passo de instalação conforme explicado abaixo ou nos links dos tutoriais disponibilizados.

### Repositório GitHub
Para fazer o download deste repositório basta clonar numa pasta de sua `preferência`.

```
$ git clone https://github.com/GabrielCalmon/Desafio_Pong_2021-1
``` 

### Arduino
Para instalação da IDE Arduino acesse https://www.arduino.cc/en/software e escolha a opção referente ao seu sistema operacional.

Caso prefira, é possível acessar o compilador online https://create.arduino.cc/editor

### Processing 3
Para instalação do Processing 3 acesse https://processing.org/download/ e escolha a opção referente ao seu sistema operacional.

Também é necessária a instalação da biblioteca *Sound* do *processing 3*, conforme os passos enumerados nas imagens abaixo abaixo:

- **1.** Clique em "Sketch"
- **2.** Clique em "Importar Biblioteca"
- **3.** Clique em "Adicionar Biblioteca..."
- **4.** Na barra de busca digite "sound"
- **5.** Busque pela biblioteca chamada "Sound" e que tenha como *Author* (autor) "The Processing Foundation"
- **6.** Clique em "Install" (instalar)

![banner](https://github.com/GabrielCalmon/Desafio_Pong_2021-1/blob/main/resources/processing-bib-1.png?raw=true)
![banner](https://github.com/GabrielCalmon/Desafio_Pong_2021-1/blob/main/resources/processing-bib-2.png?raw=true)

## Desenvolvimento
### Hardware
O esquema de ligação necessário ao projeto pode ser visto na imagem abaixo:

![banner](https://github.com/GabrielCalmon/Desafio_Pong_2021-1/blob/main/resources/circuito-ligacoes.jpeg?raw=true)

### Software
Abra o arquivo *controllers.ino* localizado na pasta ```Desafio_Pong_2021-1/controllers``` e carregue-o no seu Arduino

Em seguida abra o arquivo *receiver_p3.pde* localizado na pasta ```Desafio_Pong_2021-1/receiver_p3```, localize a variável do tipo String chamada "com_usada" e altere o texto entre aspas pelo nome porta do seu computador a qual o Arduino está conectado.

```String com_usada = "NOME DA PORTA";```

Caso não saiba o nome da porta utilizada abra a IDE Arduino e no canto inferior direito da tela estará escrito a informação desejada, conforme a imagem abaixo.

![banner](https://github.com/GabrielCalmon/Desafio_Pong_2021-1/blob/main/resources/arduino-porta.png?raw=true)

## Informações para Contato
Caso deseje falar com os desenvolvedores do projeto seguem informações para contato:

**Alexandre Adonai**
- Email: 
- GitHub: https://github.com/Alexandreaags

**Gabriel Calmon**
- Email:joao.calmon@aln.senaicimatec.edu.br
- GitHub: https://github.com/GabrielCalmon
- Lattes: http://lattes.cnpq.br/3714599132684846

**Vitor Mendes**
- Email:
- GitHub: https://github.com/vitorsmends
- Latter:
- LinkedIn: 

*“Fazer ou não fazer. Tentativa não há”* - Mestre Yoda