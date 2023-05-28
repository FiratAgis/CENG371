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
## @deftypefn {} {@var{x1} =} power_method (@var{A}, @var{x0})
##
## @seealso{}
## @end deftypefn

## Author: firat <firat@DESKTOP-JL0MBBC>
## Created: 2022-12-15

function [l1, x1] = power_method (A, x0)
  if ~exist('x0','var')
    [m, n] = size(A);
    x0 = transpose(ones(1, n));
  endif
  x1 = zeros(size(x0));
  count = 0;
  while norm(x0 - x1) > 0.000000000000001 && count < n * 10000
    x1 = x0;
    x0 = A*x1;
    x0 = x0 * (1/norm(x0));
    count = count + 1;
  endwhile
  l1 = (A*x1)(1) / x1(1);
endfunction
