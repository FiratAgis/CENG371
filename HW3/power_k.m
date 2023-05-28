function [l, x] = power_k (A, k)
  l = {};
  x = {};
  for i = 1:k
    [l1, x1] = power_method(A);
    l{i} = l1;
    x{i} = x1;
    A = A - (l1 * ((x1*transpose(x1)) / (transpose(x1) * x1)));
  endfor
endfunction
