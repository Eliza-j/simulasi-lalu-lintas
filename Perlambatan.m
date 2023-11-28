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
% ## @deftypefn {} {@var{retval} =} Perlambatan (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: Elisa <Elisa@ELISA>
% ## Created: 2021-05-18

function jalan=Perlambatan(statusKendaraan,jenisKendaraan,pSlow) 
%% fungsi tahap perlambatan 

penjal=jenisKendaraan; 
jal=statusKendaraan;

[baris_sel,panjang_sel] = size(jal);  
for i=1:baris_sel 
     for j=1:panjang_sel 
         angka_random=100*rand; 
         try 
             if jal(i,j)~=100 && jal(i,j)>0 && angka_random<=pSlow 
                 if penjal(i,j)==2 
                     jal(i,j)=jal(i,j)-1; 
                 elseif penjal(i+1,j)==penjal(i,j) && penjal(i,j)>=400 && i<baris_sel  
                     jal(i,j)=jal(i,j)-1; 
                     jal(i+1,j)=jal(i,j); 
                 end 
             end 
         catch ME 
             %indeks terlalu besar 
         end 
     end 
end 

jalan=jal; 
end
