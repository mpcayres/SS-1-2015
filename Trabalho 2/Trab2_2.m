% Trabalho 2 de Sinais e Sistemas
% Professor: Alexandre Zaghetto
% Componentes:
%   Ingrid Santana Lopes (14/0083065)
%   Marcos Paulo Cayres Rosa (14/0027131)

% Prepara o ambiente
clc; clear all; close all;

% Define elementos os simbólicos
syms t w;
syms x(t) h(t) u(t);
syms x2(t) h2(t) c(t);
syms X(w) H(w) C(w);

% Define os valores de tempo
XMIN = -5; XMAX = 5; YMIN = -3; YMAX = 3;

n = XMIN:XMAX;
u1(n >= 0) = 1;
x1 = 2.*exp(-n).*u1;
h1 = n.*exp(-n).*u1;
c1 = conv(x1, h1, 'same');
figure;
subplot(3,1,1); plot(n,x1); title('x[n] = 2e^{-t}');
subplot(3,1,2); plot(n,h1); title('h[n] = te^{-t}u[n]');
subplot(3,1,3); plot(n,c1); title('x[n] * h[n]');

u(t) = heaviside(t);
x(t) = 2.*exp(-t).*u(t);
h(t) = t.*exp(-t).*u(t);

figure;
subplot(3,1,1); ezplot(t, u(t), [XMIN XMAX YMIN YMAX]); title('u(t)');
subplot(3,1,2); ezplot(t, x(t), [XMIN XMAX YMIN YMAX]); title('x(t)');
subplot(3,1,3); ezplot(t, h(t), [XMIN XMAX YMIN YMAX]); title('h(t)');

X(w) = fourier(x(t))
%X(w) = int(x(t).*exp(-1i*t*w),t,-inf,inf); pretty(X(w))
H(w) = fourier(h(t))
%H(w) = int(h(t).*exp(-1i*t*w),t,-inf,inf); pretty(H(w))
C(w) = X(w).*H(w)

figure;
subplot(3,1,1); ezplot(w, abs(X(w)), [XMIN XMAX YMIN YMAX]); title('Módulo de X(jw)');
subplot(3,1,2); ezplot(w, abs(H(w)), [XMIN XMAX YMIN YMAX]); title('Módulo de H(jw)');
subplot(3,1,3); ezplot(w, abs(C(w)), [XMIN XMAX YMIN YMAX]); title('Módulo de X(jw) x H(jw)');

figure;
subplot(3,1,1); ezplot(w, angle(X(w)), [XMIN XMAX YMIN YMAX]); title('Fase de X(jw)');
subplot(3,1,2); ezplot(w, angle(H(w)), [XMIN XMAX YMIN YMAX]); title('Fase de H(jw)');
subplot(3,1,3); ezplot(w, angle(C(w)), [XMIN XMAX YMIN YMAX]); title('Fase de X(jw) x H(jw)');

x2 = ifourier(X(w),t)
%x2(t) = int(X(w).*exp(1i*t*w),t,-inf,inf); pretty(x(t))
h2 = ifourier(H(w),t)
%h2(t) = int(H(w).*exp(1i*t*w),t,-inf,inf); pretty(h(t))
c = ifourier(C(w),t)
%c(t) = int(C(w).*exp(1i*t*w),t,-inf,inf); pretty(c(t))

figure;
subplot(3,1,1); ezplot(t, x2, [XMIN XMAX YMIN YMAX]); title('x(t)');
subplot(3,1,2); ezplot(t, h2, [XMIN XMAX YMIN YMAX]); title('h(t)');
subplot(3,1,3); ezplot(t, c, [XMIN XMAX YMIN YMAX]); title('x(t) * h(t)');