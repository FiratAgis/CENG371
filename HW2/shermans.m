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
## @deftypefn {} {@var{retval} =} shermans (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: firat <firat@DESKTOP-JL0MBBC>
## Created: 2022-12-04

function [L,U] = shermans(A)
   k = length(A);
    if k > 1
        A_k = A(1 : k - 1, 1 : k - 1);
        a_k = A(k, k);
        a_1k = A(k, 1: k - 1);
        a_k1 = A(1 : k - 1, k);
        [L_11, U_11] = shermans(A_k);
        u_1k = inverse(L_11)  * transpose(a_1k);
        l_k1 = transpose(inverse(U_11)) * a_k1;
        u_kk = a_k - transpose(l_k1) * u_1k;
        L = [L_11 zeros(k-1,1) ; transpose(l_k1) 1];
        U = [U_11 u_1k; zeros(1, k-1) u_kk];
    else
        L = [1];
        U = A(1, 1);
    end
endfunction
