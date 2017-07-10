% Marcos Paulo Cayres Rosa - 14/0027131
clc;
clear all;
close all;

t = 2:0.001:5;
x = 3*exp(0.4*t);
y = 2*exp(-0.9*t);

plot(t,x);
hold on;
plot(t,y ,'r','LineWidth',2);

xlabel('t');
ylabel('f(t)');
title('x(t) = 3*exp(0.4*t) e y(t) = 2*exp(-0.9*t)','FontSize',12);
legend('x(t)', 'y(t)','Location','North');
grid on;