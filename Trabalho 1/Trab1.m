% Trabalho 1 de Sinais e Sistemas
% Professor: Alexandre Zaghetto
% Componentes:
%   Ingrid Santana Lopes (14/0083065)
%   Marcos Paulo Cayres Rosa (14/0027131)

% Prepara o ambiente
clear all; close all; clc;

% Especifica Resistência e Capacitância
R = 220*(10^(-9)); C = 91;

% Determina o tempo a ser analisado
tpInicial = -3*(1/(R*C));
tpFinal = -tpInicial;
tpTotal = tpInicial:tpFinal;

% Calcula os valores de H(jw)
for w = tpInicial:tpFinal
    H(w+tpFinal+1) = (R*C*1j*w)/((R*C*1j*w)+1);
end

% Plota os gráficos
subplot(2,1,1); plot(tpTotal, abs(H)); title ('Módulo de H(jw)');
subplot(2,1,2); plot(tpTotal, angle(H)); title ('Fase de H(jw)');