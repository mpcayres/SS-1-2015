% Laborat�rio 6 de Sinais e Sistemas
% Professor: Alexandre Zaghetto
% Aluno: Marcos Paulo Cayres Rosa
% Matr�cula: 14/0027131

% Prepara o ambiente
clear all; close all; clc;

% Define elementos os simb�licos t, x(t), y(t) e L(t)
syms t;
syms x(t); syms y(t); syms L(t);

% Define as fun��es x(t), y(t) e L(t) e os n�meros complexos z1 e z2
x(t) = cos(t);
y(t) = sin(2*t);
z1 = 3 + 2*1i;
z2 = 2;
L(t) = z1*x(t) + z2*y(t);

% Define os valores de tempo e per�odos a serem usados
tpInicial = -4;
tpFinal = 4;
T1 = 2*pi;
T2 = pi;

% Determina��o da S�rie de Fourier de z1*x(t) + z2*y(t), utilizando-se do
% per�odo 2*pi para determinar Fk por este ser o m�nimo m�ltiplo comum entre T1 e T2
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
subplot(2,2,2); stem(tpInicial:tpFinal, Fk); title ('S�rie de Fourier de z1*x(t) + z2*y(t)');
subplot(2,2,3); stem(tpInicial:tpFinal, abs(Fk)); title ('M�dulo da S�rie de Fourier');
subplot(2,2,4); stem(tpInicial:tpFinal, angle(Fk)); title ('Fase da S�rie de Fourier');

% Determina��o de Ak e Bk
for k = tpInicial:tpFinal
    ex1 = exp(-1i*k*(2*pi/T1)*t);
    Ak(k+tpFinal+1) = eval((1/T1)*int(x(t)*ex1, t, 0, T1));
    
    ex2 = exp(-1i*k*(2*pi/T2)*t);
    Bk(k+tpFinal+1) = eval((1/T2)*int(y(t)*ex2, t, 0, T2));
end

figure;
subplot(2,2,1); stem(tpInicial:tpFinal, Ak); title ('Ak');
subplot(2,2,2); stem(tpInicial:tpFinal, z1*Ak); title ('z1*Ak');
subplot(2,2,3); stem(tpInicial:tpFinal, abs(z1*Ak)); title ('M�dulo de z1*Ak');
subplot(2,2,4); stem(tpInicial:tpFinal, angle(z1*Ak)); title ('Fase de z1*Ak');

figure;
subplot(2,2,1); stem(tpInicial:tpFinal, Bk); title ('Bk');
subplot(2,2,2); stem(tpInicial:tpFinal, z2*Bk); title ('z2*Bk');
subplot(2,2,3); stem(tpInicial:tpFinal, abs(z2*Bk)); title ('M�dulo de z2*Bk');
subplot(2,2,4); stem(tpInicial:tpFinal, angle(z2*Bk)); title ('Fase de z2*Bk');

% Determina��o de z1*Ak + z2*Bk
Lk = z1*Ak + z2*Bk;

figure;
subplot(2,2,1); stem(tpInicial:tpFinal, Ak + Bk); title ('Ak + Bk');
subplot(2,2,2); stem(tpInicial:tpFinal, Lk); title ('z1*Ak + z2*Bk');
subplot(2,2,3); stem(tpInicial:tpFinal, abs(Lk)); title ('M�dulo de z1*Ak + z2*Bk');
subplot(2,2,4); stem(tpInicial:tpFinal, angle(Lk)); title ('Fase de z1*Ak + z2*Bk');