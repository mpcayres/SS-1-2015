% Laborat�rio 3 de Sinais e Sistemas
% Marcos Paulo Cayres Rosa - 14/0027131
close all; clear all; clc;

[audio,FS,bits]=wavread('darkorig');
sound(audio, FS);

tempo = 0:1/FS:length(audio)/FS-1/FS;
plot(tempo,audio); title('Gr�fico �udio em fun��o do tempo');
xlabel('Tempo'); ylabel('�udio'); grid on;

respimp;

tempo2 = 0:1/FS:length(h)/FS-1/FS;
figure; stem(tempo2,h); title('Gr�fico da resposta ao impulso h');
xlabel('Tempo'); ylabel('Amplitude');

y = convolucao(audio,h);
figure; plot(tempo,y); title('Gr�fico do �udio em fun��o do tempo ap�s a convolu��o');
xlabel('Tempo'); ylabel('�udio'); grid on;

pause(3); sound(y, FS);
wavwrite(y,FS,'darksideResult.wav');