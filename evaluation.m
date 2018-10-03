function valeurs = evaluation(x,data)
    c = differences_divisees(data);
    valeurs = [];
    for i = [1:length(x)]
        eval = c(1);
        for j = [1:length(c)-1]
            multi = 1;
            for k = [1:j]
                multi = multi*(x(i)-data(1,k));
            end
            eval = eval + c(j+1)*multi;
        end
        valeurs = [valeurs eval];
    end
end