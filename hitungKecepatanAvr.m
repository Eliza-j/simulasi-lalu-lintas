## Copyright (C) 2021 Elisa
##
## This program is free software:you can redistribute it and / or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program. If not, see < https: // www.gnu.org / licenses /> .

## - *- texinfo - *-
## @deftypefn {} {@var{retval} =} hitungKecepatanAvr (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:Elisa < Elisa@ELISA>
## Created:2021 - 06 - 02

function kecepatan_mean = hitungKecepatanAvr (status, jenis)
    avr = 0;
    jumlah_kendaraan = 0;
    [baris_sel, panjang_sel] = size(status);

    for i = 1:baris_sel

        for j = 1:panjang_sel

            if jenis(i, j) == 2

                switch status(i, j)
                    case 0
                        avr += 0;
                        jumlah_kendaraan += 1;
                    case 1
                        avr += 18;
                        jumlah_kendaraan += 1;
                    case 2
                        avr += 36;
                        jumlah_kendaraan += 1;
                    case 3
                        avr += 54;
                        jumlah_kendaraan += 1;
                    case 4
                        avr += 72;
                        jumlah_kendaraan += 1;
                    case 5
                        avr += 90;
                        jumlah_kendaraan += 1;
                    case 6
                        avr += 108;
                        jumlah_kendaraan += 1;
                    case 7
                        avr += 126;
                        jumlah_kendaraan += 1;
                    case 8
                        avr += 144;
                        jumlah_kendaraan += 1;
                    case 9
                        avr += 162;
                        jumlah_kendaraan += 1;
                    case 10
                        avr += 180;
                        jumlah_kendaraan += 1;
                    case 11
                        avr += 198;
                        jumlah_kendaraan += 1;
                    case 12
                        avr += 216;
                        jumlah_kendaraan += 1;
                    case 13
                        avr += 234;
                        jumlah_kendaraan += 1;
                    case 14
                        avr += 252;
                        jumlah_kendaraan += 1;
                    case 15
                        avr += 270;
                        jumlah_kendaraan += 1;
                    case 16
                        avr += 288;
                        jumlah_kendaraan += 1;
                    case 17
                        avr += 306;
                        jumlah_kendaraan += 1;
                    case 18
                        avr += 324;
                        jumlah_kendaraan += 1;
                    case 19
                        avr += 342;
                        jumlah_kendaraan += 1;
                    case 20
                        avr += 360;
                        jumlah_kendaraan += 1;
                    case 21
                        avr += 378;
                        jumlah_kendaraan += 1;
                    case 22
                        avr += 396;
                        jumlah_kendaraan += 1;
                    case 23
                        avr += 414;
                        jumlah_kendaraan += 1;
                    case 24
                        avr += 432;
                        jumlah_kendaraan += 1;
                    case 25
                        avr += 450;
                        jumlah_kendaraan += 1;
                end

            elseif jenis(i, j) >= 400 && i < baris_sel && jenis(i+1,j)==jenis(i, j) 

                switch status(i, j)
                    case 0
                        avr += 0;
                        jumlah_kendaraan += 1;
                    case 1
                        avr += 18;
                        jumlah_kendaraan += 1;
                    case 2
                        avr += 36;
                        jumlah_kendaraan += 1;
                    case 3
                        avr += 54;
                        jumlah_kendaraan += 1;
                    case 4
                        avr += 72;
                        jumlah_kendaraan += 1;
                    case 5
                        avr += 90;
                        jumlah_kendaraan += 1;
                    case 6
                        avr += 108;
                        jumlah_kendaraan += 1;
                    case 7
                        avr += 126;
                        jumlah_kendaraan += 1;
                    case 8
                        avr += 144;
                        jumlah_kendaraan += 1;
                    case 9
                        avr += 162;
                        jumlah_kendaraan += 1;
                    case 10
                        avr += 180;
                        jumlah_kendaraan += 1;
                    case 11
                        avr += 198;
                        jumlah_kendaraan += 1;
                    case 12
                        avr += 216;
                        jumlah_kendaraan += 1;
                    case 13
                        avr += 234;
                        jumlah_kendaraan += 1;
                    case 14
                        avr += 252;
                        jumlah_kendaraan += 1;
                    case 15
                        avr += 270;
                        jumlah_kendaraan += 1;
                    case 16
                        avr += 288;
                        jumlah_kendaraan += 1;
                    case 17
                        avr += 306;
                        jumlah_kendaraan += 1;
                    case 18
                        avr += 324;
                        jumlah_kendaraan += 1;
                    case 19
                        avr += 342;
                        jumlah_kendaraan += 1;
                    case 20
                        avr += 360;
                        jumlah_kendaraan += 1;
                    case 21
                        avr += 378;
                        jumlah_kendaraan += 1;
                    case 22
                        avr += 396;
                        jumlah_kendaraan += 1;
                    case 23
                        avr += 414;
                        jumlah_kendaraan += 1;
                    case 24
                        avr += 432;
                        jumlah_kendaraan += 1;
                    case 25
                        avr += 450;
                        jumlah_kendaraan += 1;
                end

            end

        end

    end

    kecepatan_mean = avr / jumlah_kendaraan;
endfunction
