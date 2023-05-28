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
## @deftypefn {} {@var{retval} =} crouts (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: firat <firat@DESKTOP-JL0MBBC>
## Created: 2022-12-04

function  [L,U] = crouts(A)
  [l, k] = size(A);
    if l > 1
        [L_11, U_11] = crouts(A(1:l-1, 1:l-1));
        U = [U_11 zeros(l-1, 1); zeros(1, l-1) zeros(1,1)];
        L = [L_11 zeros(l-1, 1); zeros(1, l-1) zeros(1,1)];
        L(l, 1) = A(l, 1);
        U(l, l) = 1;
        U(1, l) = A(1, l) / L(1, 1);
        for j = 2:l
            L(l, j) = A(l, j) - (L(l, 1:j - 1) * U(1:j - 1, l));
        end
        for j = 2:(l - 1)
            U(j, l) = (A(j, l) - L(j, 1:j - 1) * U(1:j - 1, l)) / L(j, j);
        end
    else
        L = [A(1, 1)];
        U = [1];
    end
endfunction
