%% TP2 Exercice 2
%% Partie a
%%
% On va commencer par calculer les abscisses xi : 
xc=[0:1:50]; % on initialise l'intervalle de données
xeq=[-1:0.04:1]; % on initialise les x équidistants
%%
% On va calculer les abscisses de Chebyschev sur l'intervalle x :
for i = 1:length(xc)
    xc(i)=cos((2*(i-1)+1)/(2*50+2)*pi);
end
%%
% On calcule maintenant le poid des abscisses de Chebyschev selon la méthode
% générale : 
w_gen_ch=ones(length(xc),1); % on initialise l'intervalle de poid
for i = 1:length(w_gen_ch)
    for j = 1:length(xc)
        if i==j
            w_gen_ch(i)=w_gen_ch(i)*1;
        else 
            w_gen_ch(i)=w_gen_ch(i)*(1/(xc(i)-xc(j)));
        end
    end
end
%%
% On calcule le poid pour les abscisses de Chebyschev
for i = 1:length(xc)
    w_c(i)= (-1)^(i-1)*2^50/(50+1)*sin((2*(i-1)+1)/(2*50+2)*pi);
end
%%
% On fait de même pour les poids équidistants : 
w_gen_eq=ones(length(xeq),1); % on initialise l'intervalle de poid pour les points équidistants
for i = 1:length(w_gen_eq)
    for j = 1:length(xeq)
        if i==j
            w_gen_eq(i)=w_gen_eq(i)*1;
        else 
            w_gen_eq(i)=w_gen_eq(i)*(1/(xeq(i)-xeq(j)));
        end
    end
end
%%
% On calcule le poid pour les points équidistant :
for i = 1:length(xc)
    w_eq(i)= (-1)^(50-(i-1))/(((2/50)^50*factorial(50)))*nchoosek(50,i-1);
end
%% Partie b
%% 
% On trace les graphes :
%%
% Pour f(x) on a : 
%
% - Avec les points équidistants
xeq=linspace(-1,1,30);
xc=[0:1:30];
x=linspace(-1,1);
for i = 1:length(xc)
    xc(i)=cos((2*(i-1)+1)/(2*30+2)*pi);
end

p1_eq=lagrangepoly(xeq,(abs(xeq)+xeq./2-xeq.^2));
y1_eq=polyval(p1_eq,x);

% calcul erreur :
erreur_eq=zeros(length(x),1);
for i=1:length(x)
    erreur_eq(i)=abs((abs(x(i))+x(i)/2-x(i)^2)-y1_eq(i));
end

% graphe
figure 
subplot(1,3,1)
hold on
plot(x, (abs(x)+x./2-x.^2)) 
axis([-1 1 -0.7 0.7])
plot(x,y1_eq, '--r')
title('Equidistants avec 30 nodes')
legend('f(x)','p1 eq')
hold off
%%
% - avec Chebyschev : 
p1_ch=lagrangepoly(xc,(abs(xc)+xc./2-xc.^2));
y1_ch=polyval(p1_ch,x);

% calcul erreur :
erreur_ch=zeros(length(x),1);
for i=1:length(x)
    erreur_ch(i)=abs((abs(x(i))+x(i)/2-x(i)^2)-y1_ch(i));
end

subplot(1,3,2)
hold on
axis([-1 1 -0.7 0.7])
plot(x, (abs(x)+x./2-x.^2)) 
plot(x,y1_ch, '--r')
title('Chebyschev avec 30 nodes')
legend('f(x)','p1 ch')
hold off

% affichage de l'erreur
subplot(1,3,3)
axis([-1 1 10^-5 10^3])
semilogy(x,erreur_eq,'+',x,erreur_ch,'x')
title('erreur plot')
%%
% Pour g(x) on a : 
% - avec points équidistants
p2_eq=lagrangepoly(xeq, (1./(1+25*xeq.^2)));
y2_eq=polyval(p2_eq,x);

% calcul erreur :
erreur_eq=zeros(length(x),1);
for i=1:length(x)
    erreur_eq(i)=abs((1/(1+25*x(i)^2))-y2_eq(i));
end

figure
subplot(1,3,1)
hold on
axis([-1 1 0 1.2])
plot(x, (1./(1+25*x.^2))) %avec points équidistant
plot(x,y2_eq, '--r')
title('Equidistants avec 30 nodes')
legend('g(x)','p2 eq')
hold off

%%
% - avec Chebyschev
p2_ch=lagrangepoly(xc, (1./(1+25*xc.^2)));
y2_ch=polyval(p2_ch,x);

% calcul erreur :
erreur_ch=zeros(length(x),1);
for i=1:length(x)
    erreur_ch(i)=abs((1/(1+25*x(i)^2))-y2_ch(i));
end

subplot(1,3,2)
hold on
axis([-1 1 0 1.2])
plot(x, (1./(1+25*x.^2))) %avec points équidistant
plot(x ,y2_ch, '--r')
title('Chebyschev avec 30 nodes')
legend('g(x)','p2 ch')
hold off

% affichage de l'erreur
subplot(1,3,3)
axis([-1 1 10^-5 10^3])
semilogy(x,erreur_eq,'+',x,erreur_ch,'x')
title('erreur plot')