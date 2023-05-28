## Copyright (C) 2022 firat
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} subspace_iteration (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: firat <firat@DESKTOP-JL0MBBC>
## Created: 2022-12-15

function [l, x] = subspace_iteration (A, k)
  [m, n] = size(A);
  X0 = [eye(k, k); eye(n-k,k)];
  X1 = zeros(n, n);
  l = {};
  x = {};
  count = 0;
  X1 = X0;
  Z = A*X1;
  [X0, R] = qr(Z);
  count = count + 1;
  X1 = X0;
  Z = A*X1;
  [X0, R] = qr(Z);
  count = count + 1;
  while (norm(X0(:,1:k) - X1(:,1:k)) > 0.000000000000001) && (count < n * 10000)
    X1 = X0;
    Z = A*X1;
    [X0, R] = qr(Z);
    count = count + 1;
  endwhile
  for i=1:k
    x{i} = X0(:,i);
    l{i} = (A*x{i})(1)/x{i}(1);
  endfor
endfunction
