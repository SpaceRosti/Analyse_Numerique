% MOI : 
function p = lagrangepoly(nodes,data)
    p = zeros(1,length(nodes)); % on initie un vecteur de 0, de longueur le nombre de couple (xi,yi) -> coeffs du polynome d'interpolation
    for k = [1 : length(nodes)];
        p = p + (data(k) * coeff_LK(k,nodes)); % on utilise la formule : on additionne tous les yi*li
    end