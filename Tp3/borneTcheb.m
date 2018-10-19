function resultat = borneTcheb(n)
    syms x
    f = sin(x);
    z = linspace(-1, 1, 100);
    g = diff(f,n+1);
    resultat = max(abs(vpa(subs(g,z))))*(((2)^(n+1))/((2^(2*n + 1))*factorial(n+1)));
end