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
% ## @deftypefn {} {@var{retval} =} simulasiLOL (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: Elisa <Elisa@ELISA>
% ## Created: 2021-05-31

function simulasiLaluLintasBatch (pnjg,pdtmin,pdtmax,r2,pmov,pslow,vmax,iterasi)
  brs = 4;
  header = "Kepadatan,Kecepatan_avr";
  dlmwrite("HasilSimLaluLintas.txt", header,'');
  x = waitbar(0,'Menjalankan simulasi...');
  for pdt = pdtmin :2: pdtmax
    jenis_kendaraan = acakPos(pnjg,brs,pdt,r2);
    statusKendaraan=initStatus(jenis_kendaraan);
    kecepatan_avr = [];    
      for i=1 : iterasi
        [jenis_kendaraan,statusKendaraan]=Pindah(statusKendaraan,jenis_kendaraan,pmov,vmax);    
        statusKendaraan = Percepatan(statusKendaraan,jenis_kendaraan,vmax);    
        statusKendaraan = Perlambatan(statusKendaraan,jenis_kendaraan,pslow);    
        [statusKendaraan,jenis_kendaraan] = moveCar(statusKendaraan,jenis_kendaraan);    
        kecepatan_avr(i) = hitungKecepatanAvr(statusKendaraan,jenis_kendaraan);           
        %#log_status(1,end+1) = statusKendaraan;  
      end
    kecepatan_avr_total = mean(kecepatan_avr);
    row_csv = [pdt,kecepatan_avr_total];
    dlmwrite("HasilSimLaluLintas.txt", row_csv, ',', '-append');
    waitbar(pdt/pdtmax)
  end
  close(x)
endfunction
