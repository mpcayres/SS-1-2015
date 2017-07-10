% Laboratório 2 de Sinais e Sistemas
% Marcos Paulo Cayres Rosa - 14/0027131
close all; clear all; clc;

u = [zeros(1,50), ones(1,101)];
t = -50:100;
stem(t,u); title('Degrau unitário u[n]');
xlabel('n'); ylabel('Amplitude');
h = u(end:-1:1);

alfa = 0.96; max = 1/(1-alfa);
x = zeros(1,50);
tam_h = 0:1:100;
aux = (alfa.^tam_h).*(ones(1,101));
x = [x aux];
figure; stem(t,x); title(['Entrada x[n] com alfa igual à ' num2str(alfa)]);
xlabel('n'); ylabel('Amplitude');

for i=1:length(x)
    resul(i)=0;
    for j=1:length(h);
        if(i-j+1 > 0)
            resul(i) = resul(i)+h(j)*x(i-j+1);
        end
    end
end
figure; stem(t,resul); title('Soma de Convolução y[n]');
xlabel('n'); ylabel('Amplitude'); 

fig = figure;
anim_conv = VideoWriter('Animacao_Convolucao.mp4','MPEG-4');
anim_conv.Quality = 100;
anim_conv.FrameRate = 5;
open(anim_conv);
F = getframe(fig);
writeVideo(anim_conv,F);

for i = 1:length(x)
    subplot(3,1,1); stem(t,x); axis([-50 100 0 1]);
    hold on; grid on; title('Entrada x[n]');
    h2 = [ones(1,i), zeros(1,151-i)];
    subplot(3,1,2); stem(t,h2); axis([-50 100 0 1]);
    grid on; ylabel('Amplitude'); title('Impulso unitário h[n]');
    subplot(3,1,3); stem(t(i),resul(i)); axis([-50 100 0 max]);
    hold on; grid on; xlabel(['n = ' num2str(i-51)]); title('Soma de Convolução');
    F = getframe(fig);
    writeVideo(anim_conv,F);
    pause(0.000001);
end

close(anim_conv);
