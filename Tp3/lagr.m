function valp=lagr(valf,x,t)
% évaluation en t du polynôme de
% Lagrange de f aux abscisses x.
% x doit être colonne
A=fliplr(vander(x));
p=A\valf;
valp=polyval(flipud(p),t);
