% Laboratório 5 de Sinais e Sistemas
% Marcos Paulo Cayres Rosa - 14/0027131
clear all; close all; clc;

% Determina o intervalo de tempo, em segundos, da simulação e como será a
% simulação da função contínua
tempoInicial = -3;
tempoFinal = 3;
funcCont = tempoInicial:1/200:tempoFinal;

numTermos = 16;
aux = 0;

for i = 1:numTermos
        
    % Freqüência do sinal, em Hertz
    freq = i;
    
    funcY = -2*( ( (-1)^i )/(pi*i) ) * sin( freq*funcCont*pi );
    
    %figure(2);
    %plot(funcCont, funcY); axis([tempoInicial tempoFinal -1 1]);
    %title(['Número de termos = ' num2str(i)]);
    %grid on;
        
    aux = aux + funcY;
    
    figure(1);
    plot(funcCont, aux); axis([tempoInicial tempoFinal -1.5 1.5]);
    ylabel('f(t)'); xlabel('t');
    title(['Número de termos = ' num2str(i)]);
    grid on;
    
    pause;
         
end