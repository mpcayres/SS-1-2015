% Marcos Paulo Cayres Rosa - 14/0027131
clc;
clear all;
close all;

% Período igual a 2*pi
t = 0:0.001:(4*pi);
y = cos(t);
plot(t,y,'LineWidth',2);

xlabel('t');
ylabel('y(t)');
title('y(t) = cos(t)','FontSize',12);
grid on;