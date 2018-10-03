function c = coeff_LK(k, nodes)
    % on sait lk(x) = produit sur j de  (x - xj)/(xk-xj) avec j~=k
    % ce qui veut dire que les racines sont les xj avec j~=k
    
 Racines = 1 % initilaise le vecteur qui contiendra les racines 
    for i = [1 : length(nodes)];
        if ( i ~= k)
            fractioni = [1 -(nodes(i))] / (nodes(k) -(nodes(i))); % on calcule les fractions de li en gardant la forme d'un polynome 
            Racines = conv(Racines,fractioni); % on les multiplie 
        end
    end
    c = Racines; % on sort lk