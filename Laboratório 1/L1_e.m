% Marcos Paulo Cayres Rosa - 14/0027131
clc;
clear all;
close all;

% y(t) = 2*exp(j*pi*t + pi/3) = 2*exp(pi/3) [cos(pi*t) + i*sin(pi*t)]
% Período igual a 2
t = 0:0.01:2;
x = 2*exp(pi/3)*cos(pi*t);
y = 2*exp(pi/3)*sin(pi*t);

fig = figure;

mov = VideoWriter('Animacao.mp4','MPEG-4');
mov.Quality = 100;
mov.FrameRate = 4;
open(mov);
F=getframe(fig);
writeVideo(mov,F);

for i = 1:length(y)
        
    compass(x(i),y(i));
    title(['t = ' num2str(t(i))]);
    F=getframe(fig);
    writeVideo(mov,F);
    pause(0.001);
    
end

close(mov);
grid on;