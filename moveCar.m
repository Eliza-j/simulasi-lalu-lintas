% ## Copyright (C) 2021 Elisa
% ##
% ## This program is free software: you can redistribute it and/or modify
% ## it under the terms of the GNU General Public License as published by
% ## the Free Software Foundation, either version 3 of the License, or
% ## (at your option) any later version.
% ##
% ## This program is distributed in the hope that it will be useful,
% ## but WITHOUT ANY WARRANTY; without even the implied warranty of
% ## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% ## GNU General Public License for more details.
% ##
% ## You should have received a copy of the GNU General Public License
% ## along with this program.  If not, see <https://www.gnu.org/licenses/>.
% 
% ## -*- texinfo -*-
% ## @deftypefn {} {@var{retval} =} moveCar (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: Elisa <Elisa@ELISA>
% ## Created: 2021-05-18

function [s_kendaraan,j_kendaraan] = moveCar(status_kendaraan,jenis_kendaraan) 
%% fungsi tahap pindah sel 

penjal=jenis_kendaraan; 
jal=status_kendaraan; 
[baris_sel,panjang_sel] = size(jal);
  
idpindah=zeros(baris_sel,panjang_sel); 
for i=1:baris_sel 
    for j=panjang_sel:-1:1 
        if jal(i,j)>=1 && jal(i,j)<=25 
            idpindah(i,j)=j+jal(i,j); 
        end 
    end 
end 
  
for i=1:baris_sel 
    for j=panjang_sel:-1:1 
        if idpindah(i,j)~=0 
            if mod(idpindah(i,j),panjang_sel)==0 
                p=panjang_sel; 
            else 
                p=mod(idpindah(i,j),panjang_sel); 
            end 
            penjal(i,p)=penjal(i,j); 
            penjal(i,j)=0;
            jal(i,p) = jal(i,j); 
            jal(i,j)=100; 
        end 
    end 
end 

j_kendaraan = penjal;
s_kendaraan = jal;
end
