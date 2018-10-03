% EXERCICE 1 

% POINT 1 )
% fonction coeff_LK définie dans fichier à part

% POINT 2 ) 
%fonction lagrangepoly définie dans fichier à part

x = linspace(0, 1, 100);
y = x;

nodes5 = linspace(0, 1, 6); % on créer 5 x de distance égale entre 0 et 1
nodes15 = linspace(0, 1, 16);
data5 = [1 : length(nodes5)]; % on intitie le futur vecteur des y (data)
data15 = [1 : length(nodes15)];

for i = [1:length(data5)]
    data5(i) = sin(10*log(1 + nodes5(i)));  % on entre les y des la fonction 
end
interpolation1 = lagrangepoly(nodes5, data5); % on créer le polynome d'interpolation 
interpolation1_eval = polyval(interpolation1, x); % on évalue le polynome d'interpolation en x 

for i = [1:length(data15)]
    data15(i) = sin(10*log(1 + nodes15(i)));
end
interpolation2 = lagrangepoly(nodes15, data15);
interpolation2_eval = polyval(interpolation2, x);

% pour la comparaison avec la vraie fonction sin(10log(1+x)))
for i =[1:length(x)]
    y(i) = sin(10*log(1 + x(i)));
end

%on affiche le tout 
subplot(1,2,1);
hold on 
plot(x, interpolation1_eval, 'r')
plot(x, y, 'b--')
plot(nodes5,data5,'o')
legend('pn(x)', 'f(x)', 'data5')
hold off
subplot(1,2,2);
hold on
plot(x, interpolation2_eval, 'r')
plot(x, y, 'b--')
plot(nodes15,data15,'o')
legend('pn(x)', 'f(x)', 'data15')
hold off

% POINT 3)
% 2*x^3 + x - 1 

data52 = [1 : length(nodes5)]; % on intitie le futur vecteur des y (data) de longueur le nombre de points choisis 
data152 = [1 : length(nodes15)];

for i = [1:length(data52)]
    data52(i) = 2*nodes5(i)^3+nodes5(i)-1;  % on entre les y des la fonction 
end
interpolation12 = lagrangepoly(nodes5, data52); % on créer le polynome d'interpolation 
interpolation12_eval = polyval(interpolation12, x); % on évalue le polynome d'interpolation en x 

for i = [1:length(data152)]
    data152(i) = 2*nodes15(i)^3+nodes15(i)-1;
end
interpolation22 = lagrangepoly(nodes15, data152);
interpolation22_eval = polyval(interpolation22, x);

% pour la comparaison avec la vraie fonction sin(10log(1+x)))
y2 = [1 : length(x)]; % initialise le vecteur des y
for i =[1:length(x)]
    y2(i) = 2*x(i)^3+x(i)-1;
end

figure % on affiche sur autre fenêtre 
%on affiche le tout 
subplot(1,2,1);
hold on 
plot(x, interpolation12_eval, 'r')
plot(x, y2, 'b--')
plot(nodes5,data52,'o')
legend('pn(x)', 'f(x)', 'data5')
hold off
subplot(1,2,2);
hold on
plot(x, interpolation22_eval, 'r')
plot(x, y2, 'b--')
plot(nodes15,data152,'o')
legend('pn(x)', 'f(x)', 'data15')
hold off

% La fonction d'interpolation interpole parfaitement f(x) car f(x) est un polynome.  
