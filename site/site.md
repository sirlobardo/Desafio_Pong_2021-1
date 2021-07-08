# PongZ
Uma releitura do pong para os tempos atuais.

## Introdução
### Um pouco de história.
<div style="text-align: justify"> 
O Pong é considerado o primeiro jogo da história em formato de vídeo a ser lucrativo. Criado por Nolan Bushnell e Ted Dabney, o jogo se inspira no clássico jogo de tênis de dois jogadores no qual as hastes/barras simulam as raquetes, e a bola da mesma forma que em uma partida de tênis, percorre a quadra de uma extremidade à outra até um dos jogadores não conseguir rebate-la. A versão clássica do PONG consiste em um console ligado a um monitor, sendo as hastes movidas por moedas.<p>

### O PongZ
Nesta versão adotamos o nome de PongZ, sendo "Pong" o nome do jogo original e "Z" o termo que remete ao nascimento da geração dos desenvolvedores. Neste projeto resolvemos remodelar o design, mas sem alterar a essência do jogo, mantendo as regras originais e trazendo uma clássica trilha sonora dos anos 70. Além disso, no lugar das moedas que moviam as hastes temos potenciômetros, e um arduino que faz a interpretação desses dados e envia para o computador através da porta USB, enviando também informações dos botões push buttons que permitem ao jogador pausar ou resetar a partida.<p>

### Justificativa
O PongZ é um projeto criado dentro da disciplina de Sistemas Embarcados, ministrada pelo Prof. Marco Reis, no curso de Engenharia Elétrica do SENAI CIMATEC com intuito de explorar as habilidades desenvolvidas durante a disciplina, tais como a utilização de sensores e atuadores, leitura de sinais analógicos e digitais, comunicação entre componentes, fazer a interação entre software e hardware através de comunicação serial e manipulação de dados capturados em um sistema embarcado.<p></div>

## Detalhamento
<div style="text-align: justify"> 
O hardware do projeto conta com dois botões, dois potenciômetros e um arduino. Quanto ao software, o arduino foi programado para monitorar os sensores e enviar estes dados através da comunicação serial, enquanto um algoritmo em Processing 3 foi responsável pela interface do jogo.
<p></div>

## Simulação
<div style="text-align: justify"> 
Para uma melhor didática de como foram feitas as conexões dos potenciômetros e push buttons ao arduino, foi construído um esquema de ligação no Tinkercad, conforme a imagem abaixo. As ligações dos potenciômetros foram, respectivamente, o terminal 1 ligado ao GND, o terminal 2 aos pinos analógicos A0 e A2 e o terminal 3 ligado ao 5V. Já os push buttons, foram ligados, respectivamente, o terminal 1B aos pinos digitais 9 e 8 e o terminal 2B ao GND.<p></div>
<br/>
<br/>

![Bobst](https://i.imgur.com/rbHTpYk.jpg[/img])
<div style="text-align: center"> 
Figura 1. <br/>
O circuito acima foi projetado através do TinkerCAD.<br/>
Fonte: Autoria Própria.</div>
<br/>
<br/>
O vídeo abaixo tem como objetivo representar a versão final do jogo, demonstrando a jogabilidade e suas funções.

<div class="embed-responsive embed-responsive-16by9">

<iframe width="415" height="315" src="https://www.youtube.com/embed/Yl8Gpslcpxw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</div>

![Bobst](https://i.imgur.com/zk8ti6l.png[/img])

# Equipe de Desenvolvimento
### **Orientador**
**Prof. Marco Reis**
- Email: marco.reis@fieb.org.br
- GitHub https://github.com/mhar-vell

**Alexandre Adonai**
- Email: alexandre.s@aln.senaicimatec.edu.br
- GitHub: https://github.com/Alexandreaags

**Gabriel Calmon**
- Email: joao.calmon@aln.senaicimatec.edu.br
- GitHub: https://github.com/GabrielCalmon
- Lattes: http://lattes.cnpq.br/3714599132684846

**Vitor Mendes**
- Email: joao.mendes@aln.senaicimatec.edu.br
- GitHub: https://github.com/vitorsmends
- Lattes: http://lattes.cnpq.br/1253937974490834
- LinkedIn: https://www.linkedin.com/in/jo%C3%A3o-v%C3%ADtor-s-mendes-aa2ab71b5

### Resumo do Projeto
1. Categoria: Sistemas Embarcados
2. Prazo:
3. Data de início: 25/05/2021
4. Data de término: 
5. Repositório URL: https://github.com/GabrielCalmon/Desafio_Pong_2021-1
6. Sponsor:
7. Recursos materiais: US$
8. Apresentação URL:
9. Report URL:
10. Artigos relacionados: