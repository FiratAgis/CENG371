function [R, t] = the3_test(f, A, n)
  R = zeros(1, n);
  timer = tic;
  [l, x] = f(A, n);
  t = toc(timer);
  for i = 1:n
    R(1, i) = norm(A*x{i}-l{i}*x{i}) / norm(l{i});
  endfor
endfunction
