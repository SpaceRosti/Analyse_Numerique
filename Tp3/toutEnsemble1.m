function resultat = toutEnsemble1(n)
    points = linspace(-1,1,n+1);
    
    data = 1./(1 + points.^2);
    z = linspace(-1, 1, 100);

    polyInter = lagr(data.',points,z);
    Funct = 1./(1 +z.^2);
    resultat1 = max(abs(polyInter - Funct));
    
    polyInter = [];
    
    for i = z
        polyInter = [polyInter langrangeInterpolationBarycentrique(i,[points;data])];
    end
    resultat2 = max(abs(polyInter - Funct));
    
    syms x
    f = 1 / (1 + x^2);
    g = diff(f,n+1);
    resultat3 = max(abs(vpa(subs(g,z))))*(((2)^(n+1))/((2^(2*n + 1))*factorial(n+1)));
    
    resultat = [resultat1;resultat2;resultat3];
end