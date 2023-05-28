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
## @deftypefn {} {@var{retval} =} test(f, n) (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: firat <firat@DESKTOP-JL0MBBC>
## Created: 2022-12-04

function R = test(f, n)
  R = zeros(n, 2);
    for i = 1:n
        disp(i);
        A_n = hilb(i);
        timer = tic;
        [L_n, U_n] = f(A_n);
        R(i, 1) = toc(timer);
        R(i, 2) = norm(A_n - (L_n * U_n)) / norm(A_n);
    end
endfunction
