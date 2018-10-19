function resultat = barycentriqueEqui(n)
    x = linspace(-1,1,n+1); % d�f points �quidistants
    data = sin(x);
    z = linspace(-1, 1, 100);
    polyInter = [];
    
    for i = z
        polyInter = [polyInter langrangeInterpolationBarycentrique(i,[x;data])];
    end
    
    Funct = sin(z);
    resultat = max(abs(polyInter - Funct));
end