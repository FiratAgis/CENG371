test_count = 30;
R = zeros(2, test_count);
t = zeros(2, test_count);
for i = 1:test_count
  [R_temp, t_temp] = the3_test(@power_k, Problem.A, i);
  R(1, i) = sum(R_temp);
  t(1, i) = t_temp;
  [R_temp, t_temp] = the3_test(@subspace_iteration, Problem.A, i);
  R(2, i) = sum(R_temp);
  t(2, i) = t_temp;
endfor

