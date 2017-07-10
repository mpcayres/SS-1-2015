% Laborat�rio 5 de Sinais e Sistemas
% Marcos Paulo Cayres Rosa - 14/0027131
clear all; close all; clc;

% Determina o intervalo de tempo, em segundos, da simula��o e como ser� a
% simula��o da fun��o cont�nua
tempoInicial = 0;
tempoFinal = 1;
funcCont = tempoInicial:1/200:tempoFinal;

numTermos = 16;
aux = 0.5;

% Freq��ncia do sinal, em Hertz
freq = 1;

for i = 1:numTermos
            
    funcY = ( 2/( ((i*2)-1)*pi ) ) * sin( freq.*funcCont*((i*2)-1)*(2*pi) );
    
    %figure(2);
    %plot(funcCont, ycont); axis([tempoInicial tempoFinal -1 1]);
    %title(['N�mero de termos = ' num2str(i)]);
    %grid on;
        
    aux = aux + funcY;
    
    figure(1);
    plot(funcCont, aux); axis([tempoInicial tempoFinal -0.2 1.2]);
    ylabel('f(t)'); xlabel('t');
    title(['N�mero de termos = ' num2str(i)]);
    grid on;
    
    pause;
    
end