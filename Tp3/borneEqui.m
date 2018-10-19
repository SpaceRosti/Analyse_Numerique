function resultat = borneEqui(n)
    syms x
    f = sin(x);
    z = linspace(-1, 1, 100);
    g = diff(f,n+1);
    resultat = max(abs(vpa(subs(g,z))))*(1/(4*(n+1)))*((2/n)^(n+1));
end