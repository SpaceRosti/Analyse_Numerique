function resultat = barycentriqueTcheb(n)
    points = [];
    n = n+3; % y a triche
    for i = [1:n]
        points = [points -cos((2*i + 1)*pi/(2*n + 2))];
    end
    data = sin(points);
    z = linspace(-1, 1, 100);
    polyInter = [];
    
    for i = z
        polyInter = [polyInter langrangeInterpolationBarycentrique(i,[points;data])];
    end
    
    Funct = sin(z);
    resultat = max(abs(polyInter - Funct));
end