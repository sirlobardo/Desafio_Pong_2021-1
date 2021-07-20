---
layout: page
title: PongZ
subtitle: Uma releitura do pong para os tempos atuais.
cover-img: https://i.imgur.com/9AJowrB.png[/img]
---

## Introdução

### Um pouco de história.
<div style="text-align: justify"> 
O Pong é considerado o primeiro jogo da história em formato de vídeo a ser lucrativo. Criado por  Nolan Bushnell e Ted Dabney, o jogo se inspira no clássico jogo de tênis de dois jogadores em que as hastes/barras simulam as raquetes, e a bola da mesma forma que em uma partida de tênis, percorre a quadra até um dos jogadores não conseguir rebater. A versão clássica do PONG consiste em um console ligado a um monitor, sendo as hastes movidas por moedas.
</div>

### O PongZ
<div style="text-align: justify"> 
Nesta versão que adotamos o nome de PongZ, sendo "Pong" o nome do jogo original e "Z" o termo que remete o nascimento da geração dos desenvolvedores. Neste projeto resolvemos remodelar o design, mas sem alterar a essência do jogo, trazendo uma clássica trilha sonora dos anos 70. Além disso, no lugar das moedas que moviam as hastes temos potenciômetros, e um arduino que faz a interpretação desses dados e envia para o computador através da porta USB, contendo também informações dos botões push buttons que permitem o jogador controlar pausar e resetar o jogo.
</div>

### Justificativa
<div style="text-align: justify"> 
O PongZ é um projeto criado dentro da disciplina de Sistemas Embarcados no curso de Engenharia Elétrica do SENAI CIMATEC ministrado pelo Prof. Marco Reis, com intuito de explorar as habilidades desenvolvidas durante a disciplina, como fazer a interação entre software e hardware através de comunicação serial e manipulação de dados capturados em um sistema embarcados.
</div>

## Detalhamento
<div style="text-align: justify"> 
O hardware do projeto conta com dois botões, dois potenciômetros e um arduino. Quanto ao software, o arduino foi programado para monitorar os sensores e enviar estes dados através da comunicação serial, enquanto um algoritmo em Processing 3 foi responsável pela interface do jogo.
</div>

## Simulação
<div style="text-align: justify"> 
Para uma melhor didática de como foram feitas as conexões dos potenciômetros e push buttons ao arduino, foi demonstrado no Tinkercad conforme a imagem abaixo. As ligações dos potenciômetros foram, respectivamente, o terminal 1 ligado ao GND, o terminal 2 aos pinos analógicos A0 e A2 e o terminal 3 ligado ao 5V. Já os push buttons, foram ligados, respectivamente, o terminal 1B aos pinos digitais 9 e 8 e o terminal 2B ao GND.
</div>


<div style="text-align: center"> 
<img src="https://i.imgur.com/3AbOHrB.png[/img]" alt="drawing" width="500"/>
</div>

<div style="text-align: center"> 
Figura 1. <br/>
O circuito acima foi projetado através do TinkerCAD.<br/>
Fonte: Autoria Própria.</div>
<br/>

## Live Game

O vídeo abaixo tem como objetivo representar a versão final do jogo, demonstrando a jogabilidade e suas funções.

<div class="embed-responsive embed-responsive-16by9">

<iframe width="415" height="315" src="https://www.youtube.com/embed/Yl8Gpslcpxw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</div>

<br/>
<br/>

<center><h3 class="post-title">Equipe de desenvolvimento</h3><br/></center>
<div class="row">
  <div class=" col-xl-auto offset-xl-0 col-lg-4 offset-lg-0">
    <table class="table-borderless highlight">
      <thead>
        <tr>
          <th><center><img src="https://i.imgur.com/3ttQNPA.png[/img]" width="100" alt="alexandre" class="img-fluid rounded-circle" /></center></th>
          <th></th>
          <th><center><img src="https://i.imgur.com/U2jY6Uf.png[/img]" width="100" alt="joaogabriel" class="img-fluid rounded-circle"/></center></th>
          <th></th>
          <th><center><img src="https://i.imgur.com/zk8ti6l.png[/img]" width="100" alt="vitor" class="img-fluid rounded-circle"/></center></th>
          <th></th>
           <th><center><img src="" width="100" alt="marco" class="img-fluid rounded-circle"/></center></th>
        </tr>
      </thead>
      <tbody>
        <tr class="font-weight-bolder" style="text-align: center margin-top: 0">
         <td width="25.00%">Alexandre Adonai</td>
          <td></td>
          <td width="25.00%">João Gabriel Calmon</td>
          <td></td>
          <td width="25.00%">João Vítor Mendes</td>
          <td></td>
          <td width="25.00%">Marco Reis</td>
        </tr>
        <tr style="text-align: center" >
          <td style="vertical-align: top"><small>Graduando em Eng. Elétrica.</small></td>
          <td></td>
          <td style="vertical-align: top"><small>Graduando em Eng. Elétrica.</small></td>
          <td></td>
          <td style="vertical-align: top"><small>Graduando em Eng. Elétrica.</small></td>
          <td></td>
          <td style="vertical-align: top"><small>Pesquisador Sênior do projeto <br>Mestre em Engenharia de Produção e Eng. Eletricista.</small></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
<br>

## Resumo do Projeto
<ol>
<li>Categoria: Sistemas Embarcados</li>
<li>Prazo: 20 dias</li>
<li>Data de início: 25/05/2021</li>
<li>Data de término: 14/06/2021</li>
<li>Repositório URL: https://github.com/GabrielCalmon/Desafio_Pong_2021-1</li>
<li>Sponsor: Sem financiamento </li>
<li>Recursos materiais: US$ 42.00</li>
<li>Apresentação URL: https://drive.google.com/drive/folders/188Juz5FEUqrq5PzuuWtxbnuLv0CRaUem?usp=sharing</li>
<li>Report URL:</li>
</ol>

</div>