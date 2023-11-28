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
## @deftypefn {} {@var{retval} =} FgapBelakang (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Elisa <Elisa@ELISA>
## Created: 2021-06-01

function gap_jalan = FgapBelakang (i,j,jln)
panjang_sel = size(jln,2);
gap = 0;

for p=j-1:-1:0
if p == 0 
  for k = panjang_sel:-1:j+1
    if jln(i,k) == 100
        gap+=1;
    else
        break;
    end
  endfor
  gap_jalan = gap;
  return;
end

if jln(i,p) == 100
   gap += 1;
 else
   break;
endif

  if p == 1 
    for m=panjang_sel:-1:j+1
      if jln(i,m) == 100
        gap+=1;
      else
        break;
      end
    endfor 
  gap_jalan = gap;
  return;       
  end
endfor

gap_jalan = gap;
endfunction
