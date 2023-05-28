function [u_k, s_k, v_k] = approximate_svd(A, k, p)
  if ~exist('p','var')
    p = 5;
  endif
  [m, n] = size(A);
  random_matrix = randn(n, k+p);
  sample = A * random_matrix;
  Q = orth(sample);
  small_matrix = transpose(Q)*A;
  [u, s_k, v_k] = svd(small_matrix);
  u_k = Q*u;
 endfunction
