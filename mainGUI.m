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
## @deftypefn {} {@var{retval} =} main (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Elisa <Elisa@ELISA>
## Created: 2021-06-02

function mainGUI ()
close all
clear h

graphics_toolkit qt

h.labelJudul = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Simulasi Arus Lalu Lintas",
                                "horizontalalignment", "center",
                                "fontsize",14,
                                "position", [0.31 0.9 0.4 0.08]);
                                
h.labelPanjang = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Panjang jalan (sel):",
                                "horizontalalignment", "left",                                
                                "position", [0.1 0.75 0.3 0.08]);

h.editPanjang = uicontrol ("style", "edit",
                               "units", "normalized",
                               "position", [0.6 0.75 0.3 0.08]);                                
                                
h.labelKepadatan = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Kepadatan (%):",
                                "horizontalalignment", "left",                                
                                "position", [0.1 0.65 0.3 0.08]);

h.editKepadatan = uicontrol ("style", "edit",
                               "units", "normalized",
                               "position", [0.6 0.65 0.3 0.08]);                                  

h.labelRodaDua = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Persentase Kendaraan Roda Dua (%):",
                                "horizontalalignment", "left",                                
                                "position", [0.1 0.55 0.41 0.08]);   

h.editRodaDua = uicontrol ("style", "edit",
                               "units", "normalized",
                               "position", [0.6 0.55 0.3 0.08]);  
                                
h.labelPmov = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Peluang sebuah kendaraan\nberpindah lajur (%):",
                                "horizontalalignment", "left",                                
                                "position", [0.1 0.45 0.41 0.08]);

h.editPmov = uicontrol ("style", "edit",
                               "units", "normalized",
                               "position", [0.6 0.45 0.3 0.08]);                                  
                                
h.labelPslow = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Peluang sebuah kendaraan\nmemperlambat kendaraan (%):",
                                "horizontalalignment", "left",                                
                                "position", [0.1 0.35 0.41 0.08]);

h.editPslow = uicontrol ("style", "edit",
                               "units", "normalized",
                               "position", [0.6 0.35 0.3 0.08]);                                  
                                
h.labelVmax = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Kecepatan maksimal (0-25):",
                                "horizontalalignment", "left",                                
                                "position", [0.1 0.25 0.41 0.08]);

h.editVmax = uicontrol ("style", "edit",
                               "units", "normalized",
                               "position", [0.6 0.25 0.3 0.08]);                                 

h.labelIterasi = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Jumlah Iterasi:",
                                "horizontalalignment", "left",                                
                                "position", [0.1 0.15 0.41 0.08]);
                                
h.editIterasi = uicontrol ("style", "edit",
                               "units", "normalized",
                               "position", [0.6 0.15 0.3 0.08]);                                  

h.btnSimulasi = uicontrol ("style", "pushbutton",
                                 "units", "normalized",
                                 "string", "Simulasikan",
                                 "callback", @jalankanSimulasi,
                                 "position", [0.41 0.05 0.18 0.09]);                                

function jalankanSimulasi(hobject,eventdata)
  s_panjang = get (h.editPanjang, "string");
  panjang = str2num(s_panjang);
  
  s_kepadatan = get (h.editKepadatan, "string");
  kepadatan = str2num(s_kepadatan);
  
  s_rodaDua = get (h.editRodaDua, "string");
  rodaDua = str2num(s_rodaDua);
  
  s_pMov = get (h.editPmov, "string");
  pMov = str2num(s_pMov);
  
  s_pSlow = get (h.editPslow, "string");
  pSlow = str2num(s_pSlow);
  
  s_vMax = get (h.editVmax, "string");
  vMax = str2num(s_vMax);
  
  s_iterasi = get (h.editIterasi, "string");
  iterasi = str2num(s_iterasi);
  
  if isempty(panjang) || isempty(kepadatan) || isempty(rodaDua) ...
    || isempty(pMov) || isempty(pSlow) || isempty(vMax) || isempty(iterasi)
    errordlg("Mohon isi semua parameter");
    return;
  end
  
  simulasiLaluLintas(panjang,kepadatan,rodaDua,pMov,pSlow,vMax,iterasi);
end
                                 
set (gcf, "color", get(0, "defaultuicontrolbackgroundcolor"))
guidata (gcf, h)
endfunction
