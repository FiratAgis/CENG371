function [L,U] = picketts(A)
  [l, k] = size(A);
    if k > 1
        A_k = A(1 : k - 1, 1 : k - 1);
        A_k1 = A( k: l, 1 : k - 1);
        a_kk = A(k:l, k);
        a_1k = A(1: k - 1, k);
        [L_x, U_11] = picketts([A_k; A_k1]);
        L_11 = L_x(1 : k - 1, 1 : k - 1);
        L_k1 = L_x(k: l, 1 : k - 1);
        u_1k = inverse(L_11)*a_1k;
        ul_kk = a_kk - L_k1 * u_1k;
        u_kk = ul_kk(1);
        l_kk = ul_kk / u_kk;
        U = [U_11  u_1k ; zeros(1, k - 1) u_kk];
        L = [L_11 zeros(k - 1, 1) ; L_k1 l_kk];
    else
        U = [1];
        L = [A];
    end
endfunction
