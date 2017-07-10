% Marcos Paulo Cayres Rosa - 14/0027131
clc;
clear all;
close all;

% y(t) = 2*exp(j*pi*t + pi/3) = 2*exp(pi/3) [cos(pi*t) + i*sin(pi*t)]
% Período igual a 2
t = 0:0.001:2;
x = 2*exp(pi/3)*cos(pi*t);
y = 2*exp(pi/3)*sin(pi*t);

plot(t,x,'LineWidth',2);
hold on;
plot(t,y ,'--r','LineWidth',2);

xlabel('t');
ylabel('x(t)');
title('y(t) = 2*exp(j*pi*t + pi/3)','FontSize',12);
legend('Parte real','Parte imaginária','Location','Southwest');
grid on;