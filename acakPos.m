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
% ## @deftypefn {} {@var{retval} =} acakPos (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: Elisa <Elisa@ELISA>
% ## Created: 2021-05-18

function id24=acakPos(panjang_sel,baris_sel,pdt,pdt2) 
%% fungsi untuk membangkitkan posisi awal kendaraan atau untuk 
% membangkitkan status awal sel 
  
id24=zeros(baris_sel,panjang_sel); 
isi=pdt*(baris_sel*panjang_sel/100); 
isi2=round(pdt2*isi/100); 
isi4=round((isi-isi2)/2); 
idisi2=0;idisi4=0; 
penuh=0; 
while penuh==0 
    for i=1:baris_sel 
        for j=1:panjang_sel 
            rnd=100*rand; 
            if rnd<=pdt 
                rnd2=100*rand; 
                if rnd2<=pdt2 && id24(i,j)==0 && idisi2<isi2 
                    id24(i,j)=2; 
                    idisi2=idisi2+1; 
                elseif rnd2>pdt2 && id24(i,j)==0 && idisi4<isi4 
                    switch i 
                        case 1 
                            if id24(2,j)==0  
                                id24(1,j)=400; 
                                id24(2,j)=id24(1,j); 
                                idisi4=idisi4+1; 
                            end 
                        case baris_sel 
                            if id24(baris_sel-1,j)==0  
                                id24(baris_sel,j)=...
                                400; 
                                id24(baris_sel-1,j)=... 
                                id24(baris_sel,j); 
                                idisi4=idisi4+1; 
                            end 
                        otherwise 
                            if id24(i-1,j)==0 
                                id24(i,j)=400; 
                                id24(i-1,j)=id24(i,j); 
                                idisi4=idisi4+1;
                            else  
                                id24(i,j)=400; 
                                id24(i+1,j)=id24(i,j); 
                                idisi4=idisi4+1; 
                            end 
                    end 
                end 
            end 
        end 
    end 
    if idisi2>=isi2 && idisi4>=isi4 
        penuh=1; 
    end 
end   
end