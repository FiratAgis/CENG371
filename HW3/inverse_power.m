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
## @deftypefn {} {@var{retval} =} inverse_power (@var{A}, @var{alpha})
##
## @seealso{}
## @end deftypefn

## Author: firat <firat@DESKTOP-JL0MBBC>
## Created: 2022-12-15

function [l1, x1] = inverse_power (A, alpha)
  A0 = inverse(A - alpha * eye(size(A)));
  [l, x1] = power_method(A0);
  l1 = (1/l) + alpha;
endfunction
