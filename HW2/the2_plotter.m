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
## @deftypefn {} {@var{retval} =} the2_plotter (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: firat <firat@DESKTOP-JL0MBBC>
## Created: 2022-12-04

function retval = the2_plotter (axis_count, data_1, data_2, data_3, y_label, no)
  axis = 1:axis_count;
  semilogy(axis, data_1(axis, no), axis, data_2(axis, no), axis, data_3(axis, no));
  legend('shermans','picketts', 'crouts', 'Location','northwest');
  xlabel('n');
  ylabel(y_label);
  grid on
  retval = 1;
endfunction
