% Laboratório 6 de Sinais e Sistemas
% Professor: Alexandre Zaghetto
% Aluno: Marcos Paulo Cayres Rosa
% Matrícula: 14/0027131

% Prepara o ambiente
clear all; close all; clc;

% Define elementos os simbólicos t, x(t), y(t) e L(t)
syms t;
syms x(t); syms y(t); syms L(t);

% Define as funções x(t), y(t) e L(t) e os números complexos z1 e z2
x(t) = cos(t);
y(t) = sin(2*t);
z1 = 3 + 2*1i;
z2 = 2;
L(t) = z1*x(t) + z2*y(t);

% Define os valores de tempo e períodos a serem usados
tpInicial = -4;
tpFinal = 4;
T1 = 2*pi;
T2 = pi;

% Determinação da Série de Fourier de z1*x(t) + z2*y(t), utilizando-se do
% período 2*pi para determinar Fk por este ser o mínimo múltiplo comum entre T1 e T2
for k = tpInicial:tpFinal
    ex1 = exp(-1i*k*(2*pi/T1)*t);
    ex2 = exp(-1i*k*(2*pi/T2)*t);
    f(t) = (z1*x(t)*ex1 + z2*y(t)*ex2);
    Fk(k+tpFinal+1) = eval((1/(2*pi))*int(f, t, 0, 2*pi));
end

figure;
subplot(2,2,1); c = ezplot(t, imag(L), [-6,6]);
set(c,'Color','red','LineStyle','--');
hold on; ezplot(t, real(L), [-6,6]); title ('z1*x(t) + z2*y(t)');
subplot(2,2,2); stem(tpInicial:tpFinal, Fk); title ('Série de Fourier de z1*x(t) + z2*y(t)');
subplot(2,2,3); stem(tpInicial:tpFinal, abs(Fk)); title ('Módulo da Série de Fourier');
subplot(2,2,4); stem(tpInicial:tpFinal, angle(Fk)); title ('Fase da Série de Fourier');

% Determinação de Ak e Bk
for k = tpInicial:tpFinal
    ex1 = exp(-1i*k*(2*pi/T1)*t);
    Ak(k+tpFinal+1) = eval((1/T1)*int(x(t)*ex1, t, 0, T1));
    
    ex2 = exp(-1i*k*(2*pi/T2)*t);
    Bk(k+tpFinal+1) = eval((1/T2)*int(y(t)*ex2, t, 0, T2));
end

figure;
subplot(2,2,1); stem(tpInicial:tpFinal, Ak); title ('Ak');
subplot(2,2,2); stem(tpInicial:tpFinal, z1*Ak); title ('z1*Ak');
subplot(2,2,3); stem(tpInicial:tpFinal, abs(z1*Ak)); title ('Módulo de z1*Ak');
subplot(2,2,4); stem(tpInicial:tpFinal, angle(z1*Ak)); title ('Fase de z1*Ak');

figure;
subplot(2,2,1); stem(tpInicial:tpFinal, Bk); title ('Bk');
subplot(2,2,2); stem(tpInicial:tpFinal, z2*Bk); title ('z2*Bk');
subplot(2,2,3); stem(tpInicial:tpFinal, abs(z2*Bk)); title ('Módulo de z2*Bk');
subplot(2,2,4); stem(tpInicial:tpFinal, angle(z2*Bk)); title ('Fase de z2*Bk');

% Determinação de z1*Ak + z2*Bk
Lk = z1*Ak + z2*Bk;

figure;
subplot(2,2,1); stem(tpInicial:tpFinal, Ak + Bk); title ('Ak + Bk');
subplot(2,2,2); stem(tpInicial:tpFinal, Lk); title ('z1*Ak + z2*Bk');
subplot(2,2,3); stem(tpInicial:tpFinal, abs(Lk)); title ('Módulo de z1*Ak + z2*Bk');
subplot(2,2,4); stem(tpInicial:tpFinal, angle(Lk)); title ('Fase de z1*Ak + z2*Bk');