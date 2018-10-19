function resultat = lagrangeEqui(n)
    x = linspace(-1,1,n+1); % d�f points �quidistants
    data = sin(x);
    z = linspace(-1, 1, 100);

    polyInter = lagr(data.',x,z);
    Funct = sin(z);
    resultat = max(abs(polyInter - Funct));
end