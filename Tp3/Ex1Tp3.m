% Exercice 1
tab = [];
tab2 = [];
tab3 = [];
tab4 = [];
tab5 = [];
tab6 = [];
total = [];
total2 = [];

for i = [3:14]
    tab = [tab lagrangeEqui(i)];
    tab2 = [tab2 barycentriqueEqui(i)];
    tab3 = [tab3 borneEqui(i)];
    tab4 = [tab4 lagrangeTcheb(i)];
    tab5 = [tab5 barycentriqueTcheb(i)];
    tab6 = [tab6 borneTcheb(i)];
    total = [total toutEnsemble2(i)];
    total2 = [total toutEnsemble1(i)];
end

subplot(2,2,1);
semilogy([3:14],tab,'or')
hold on
semilogy([3:14],tab2,'*b')
semilogy([3:14],tab3,'-k')
hold off

subplot(2,2,2);
semilogy([3:14],tab4,'or')
hold on
semilogy([3:14],tab5,'*b')
semilogy([3:14],tab6,'-k')
hold off

subplot(2,2,3);
semilogy([2:14],total2(1,:),'or')
hold on
semilogy([2:14],total2(2,:),'*b')
semilogy([2:14],total2(3,:),'-k')
hold off

subplot(2,2,4);
semilogy([3:14],total(1,:),'or')
hold on
semilogy([3:14],total(2,:),'*b')
semilogy([3:14],total(3,:),'-k')
hold off