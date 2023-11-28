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
## @deftypefn {} {@var{retval} =} simulasiLOL (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Elisa <Elisa@ELISA>
## Created: 2021-05-31

function simulasiLaluLintas (pnjg,pdt,r2,pmov,pslow,vmax,iterasi)
  brs = 4;
  jenis_kendaraan = acakPos(pnjg,brs,pdt,r2);
  statusKendaraan=initStatus(jenis_kendaraan);
  simbol_awal=simbol(jenis_kendaraan);
  [fname, fpath] = uiputfile('*.txt','Simpan Log','log.txt');
  if fname == 0 || fpath == 0
    errordlg("Output log tidak ditentukan");
    return;
  end
  dlmwrite(fullfile(fpath, fname), "Inisialisasi", '');
  dlmwrite(fullfile(fpath, fname), simbol_awal, '', '-append');
  kecepatan_avr = [];
  #log_status = {statusKendaraan};
  
  x = waitbar(0,'Menjalankan simulasi...');
  for i=1 : iterasi
    [jenis_kendaraan,statusKendaraan]=Pindah(statusKendaraan,jenis_kendaraan,pmov,vmax);    
    statusKendaraan = Percepatan(statusKendaraan,jenis_kendaraan,vmax);    
    statusKendaraan = Perlambatan(statusKendaraan,jenis_kendaraan,pslow);    
    [statusKendaraan,jenis_kendaraan] = moveCar(statusKendaraan,jenis_kendaraan);    
    kecepatan_avr(i) = round(hitungKecepatanAvr(statusKendaraan,jenis_kendaraan));    
    simbol_i = simbol(jenis_kendaraan);   
    dlmwrite(fullfile(fpath, fname), i, '', '-append', 'roffset', 1);
    dlmwrite(fullfile(fpath, fname), simbol_i, '', '-append');    
    dlmwrite(fullfile(fpath,fname),kecepatan_avr(i),'','-append','roffset',1);    
    #log_status(1,end+1) = statusKendaraan;
    disp(simbol_i)
    disp("")
  waitbar(i/iterasi)
  end

  close(x)
  kecepatan_avr_total = round(mean(kecepatan_avr));
  dlmwrite(fullfile(fpath, fname), "Kecepatan_avr:", '', '-append', 'roffset', 2);
  dlmwrite(fullfile(fpath, fname), kecepatan_avr_total, '', '-append');
  y = msgbox("Simulasi selesai\nSilahkan buka file log untuk melihat hasil",'Sukses!');
  #save log_status.txt log_status;
endfunction
