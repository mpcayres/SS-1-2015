% Laboratório 3 de Sinais e Sistemas
% Marcos Paulo Cayres Rosa - 14/0027131
function [resul] = convolucao(x, h)

h = h(end:-1:1);
for i=1:length(x)
    resul(i)=0;
    for j=1:length(h);
        if(i-j+1 > 0)
            resul(i) = resul(i)+h(j)*x(i-j+1);
        end
    end
end

end