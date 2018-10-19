function p = langrangeInterpolationBarycentrique(x,data)
% data = paires (x,y) comme dans labo 2 : [x1, x2, x3,... xn ; y1, y2, ... yn]
% x = oû sera évalué le polynome d'interpolation  
n = size(data,2); % on sort la taille du vecteur data

% on créer le vecteur avec les poids
w = ones(1,n);
for j = [1 : n];
    xj = data(:,j);
    for i = [1:n];
        if (i ~= j);
            xi = data(:,i); % ième paire, dont on prendra le x à la commande suivante
            w(j) = w(j) * (1/(xj(1) - xi(1)));
        end
    end
end

% on s'occupe de la sum(yi * wi / (x-xi)
s = 0;
for k = [1 : n];
    ly = data(2,:); % on prend ligne des y
    lx = data(1,:);
    ky = ly(k); % on sort le kième y
    kx = lx(k);
    s = s + (ky * (w(k) / (x - kx)));      % attention à la division par 0 !! si x = kx
end

% on s'occupe de l(x) = prod(x-xj)
l = 1;
for m = [1:n];
    lignex = data(1,:);
    xm = lignex(m);
    l = l * (x - xm);
end

p = l * s;

end