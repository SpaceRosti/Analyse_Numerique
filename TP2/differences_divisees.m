%% Differences divisees

function [c] = differences_divisees(data)
    valeur = data(2,:);
    temp = [];
    c = [data(2,1)];
    for k = [1:length(data)-1]
        for i = [1:(length(valeur)-1)]
            temp = [temp (valeur(i+1) - valeur(i))/(data(1,i+k) - data(1,i))];
        end 
        valeur = temp;
        temp = [];
        c = [c valeur(1)];
    end
        
end
