% Exercice 1
tab = [];
tab2 = [];
tab3 = [];

for i = [3:14]
    tab = [tab lagrangeEqui(i)];
    tab2 = [tab2 barycentriqueEqui(i)];
    tab3 = [tab3 borneEqui(i)];
end

semilogy([3:14],tab,'or')
hold on
semilogy([3:14],tab2,'*b')
hold on
semilogy([3:14],tab3,'-k')
hold off