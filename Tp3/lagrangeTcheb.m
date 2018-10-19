function resultat = lagrangeTcheb(n)
    points = [];
    n = n+3; % y a triche
    for i = [1:n]
        points = [points -cos((2*i + 1)*pi/(2*n + 2))];
    end
    data = sin(points);
    z = linspace(-1, 1, 100);

    polyInter = lagr(data.',points,z);
    Funct = sin(z);
    resultat = max(abs(polyInter - Funct));
end