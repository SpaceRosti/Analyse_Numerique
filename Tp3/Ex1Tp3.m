% Exercice 1
for i = [3:14]
    tab = lagrangeEqui(i);
end

lagr(sin,linspace(-1,1,4),linspace(-1, 1, 100))

% Point �quidistant
function resultat = lagrangeEqui(n)
    x = linspace(-1,1,n); % d�f points �quidistants
    data = [1:length(x)];
    z = linspace(-1, 1, 100);

    for i = [1:length(data)]
        data(i) = sin(x(i));
    end

    polyInter = polyval(lagrangepoly(x,data),z);
    Funct = sin(z);
    resultat = max(abs(polyInter - Funct));
end