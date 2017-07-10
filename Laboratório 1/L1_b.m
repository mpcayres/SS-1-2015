% Marcos Paulo Cayres Rosa - 14/0027131
clc;
clear all;
close all;

% Período igual a 2/3
t = 0:0.001:(8/3);
x = 3*cos(3*pi*t + pi/3);
plot(t,x,'LineWidth',2);

xlabel('t');
ylabel('x(t)');
title('x(t) = 3*cos(3*pi*t + pi/3)','FontSize',12);
grid on;