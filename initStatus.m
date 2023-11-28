## Copyright (C) 2021 Elisa
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
## @deftypefn {} {@var{retval} =} trik (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Elisa <Elisa@ELISA>
## Created: 2021-05-31

function jalan = initStatus (jln)
  [baris_sel,panjang_sel] = size(jln);
  for i=1:baris_sel 
    for j=1:panjang_sel
      if jln(i,j) == 0
        jln(i,j) = 100;
      else
        jln(i,j) = 1;
      endif     
      end
   end  
jalan = jln;
endfunction
