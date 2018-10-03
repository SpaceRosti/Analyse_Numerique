%% Formule de Newton

% a)
% i)
c = differences_divisees([-2 -1 0 1;-53 -12 -5 16]);

% b)

test = evaluation([-2 -1 0 1],[-2 -1 0 1;-53 -12 -5 16]);


% c)
x = [0 0.2 0.4 0.6 0.8 1];
y = 2*x.^3 + x -1;

fplot(@(z) evaluation(z, [x;y]),'Linewidth',2)
hold on
fplot(@(z) 2*z^3 + z -1,'--or')
hold off

% d) Oui on peut utiliser les différences divisées pour calculer des
% polynôme de Hermite(cf. série 2). Il suffit de considérer les delta^k
% comme étant les dérivée k-ème de la fonction à interpoler. Pour ce faire
% on ajoute des paires (xi,yi) et utilisant plusieurs fois les paires
% (x,f(x)) données.
