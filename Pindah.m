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
% ## @deftypefn {} {@var{retval} =} Pindah (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
%
% ## Author: Elisa <Elisa@ELISA>
% ## Created: 2021-05-18

function [j_kendaraan,s_kendaraan] = Pindah(statusKendaraan, jenisKendaraan, pMove, vmax)

    %% fungsi pindah lajur

    penjal = jenisKendaraan;
    jal = statusKendaraan;
    [n, cel] = size(jal);

    for i = 1:n

        for j = 1:cel

            try

                if penjal(i, j) == 2
                    gap = FgapDepan(i, j, jal);

                    gapkanandepan = 0;
                    gapkananbelakang = 0;

                    if i < n
                        gapkanandepan = FgapDepan(i + 1, j, jal);
                        gapkananbelakang = FgapBelakang(i + 1, j, jal);
                    end

                    gapkiridepan = 0;
                    gapkiribelakang = 0;

                    if i > 1
                        gapkiridepan = FgapDepan(i - 1, j, jal);
                        gapkiribelakang = FgapBelakang(i - 1, j, jal);
                    end

                    vmaxtemp = 0;

                    for v = 1:n

                        for w = j - 1:-1:1

                            if jal(v, w) ~= 100
                                vmaxtemp = max([vmaxtemp jal(v, w)]);
                            end

                        end

                    end

                    kiri = false;
                    kanan = false;

                    try

                        if jal(i + 1, j) == 100
                            kanan = true;
                            gapsampingdepan = gapkanandepan;
                            gapsampingbelakang = gapkananbelakang;
                        elseif jal(i - 1, j) == 100
                            kiri = true;
                            gapsampingdepan = gapkiridepan;
                            gapsampingbelakang = gapkiribelakang;
                        end

                    catch ME
                        %indeks terlalu besar
                    end

                    if kiri && kanan

                        if gapkiridepan > gapkanandepan && ...
                                gapkiribelakang > gapkananbelakang
                            kanan = false;
                            gapsampingdepan = gapkiridepan;
                            gapsampingbelakang = gapkiribelakang;
                        else
                            kiri = false;
                            gapsampingdepan = gapkanandepan;
                            gapsampingbelakang = gapkananbelakang;
                        end

                    end

                    if kiri || kanan
                        probMove = 100 * rand;

                        if jal(i, j) >= gap && jal(i, j)< ...
                                gapsampingdepan - 1 && ...
                                gapsampingbelakang > vmaxtemp && ...
                                probMove <= pMove

                            if kiri
                                jal(i - 1, j) = jal(i, j);
                                jal(i, j) = 100;
                                penjal(i - 1, j) = penjal(i, j);
                                penjal(i, j) = 0;
                            elseif kanan
                                jal(i + 1, j) = jal(i, j);
                                jal(i, j) = 100;
                                penjal(i + 1, j) = penjal(i, j);
                                penjal(i, j) = 0;
                            end

                        end

                    end

                elseif penjal(i + 1, j) == penjal(i, j) && penjal(i, j) >= 400  && i < n 
                    gapM = FgapDepanM(i, j, jal);

                    gapMkanandepan = 0;
                    gapMkananbelakang = 0;

                    if i < n - 1
                        gapMkanandepan = FgapDepanM(i + 1, j, jal);
                        gapMkananbelakang = FgapBelakangM(i + 1, j, jal);
                    end

                    gapMkiridepan = 0;
                    gapMkiribelakang = 0;

                    if i > 1
                        gapMkiridepan = FgapDepanM(i - 1, j, jal);
                        gapMkiribelakang = FgapBelakangM(i - 1, j, jal);
                    end

                    vmaxMtemp = 0;

                    for v = 1:n

                        for w = j - 1:-1:1

                            if jal(v, w) ~= 100
                                vmaxMtemp = max([vmaxMtemp jal(v, w)]);
                            end

                        end

                    end

                    kiri = false;
                    kanan = false;

                    try

                        if jal(i + 2, j) == 100
                            kanan = true;
                            gapMsampingdepan = gapMkanandepan;
                            gapMsampingbelakang = gapMkananbelakang;
                        elseif jal(i - 1, j) == 100
                            kiri = true;
                            gapMsampingdepan = gapMkiridepan;
                            gapMsampingbelakang = gapMkiribelakang;
                        end

                    catch ME
                        %indeks terlalu besar
                    end

                    if kiri && kanan

                        if gapMkiridepan > gapMkanandepan && ...
                                gapMkiribelakang > gapMkananbelakang
                            kanan = false;
                            gapMsampingdepan = gapMkiridepan;
                            gapMsampingbelakang = gapMkiribelakang;
                        else
                            kiri = false;
                            gapMsampingdepan = gapMkanandepan;
                            gapMsampingbelakang = gapMkananbelakang;
                        end

                    end

                    if kiri || kanan
                        probMove = 100 * rand;

                        if jal(i, j) >= gapM && jal(i, j)< ...
                                gapMsampingdepan - 1 && ...
                                gapMsampingbelakang > vmaxMtemp && ...
                                probMove <= pMove

                            if kiri
                                jal(i - 1, j) = jal(i, j);
                                jal(i, j) = jal(i + 1, j);
                                jal(i + 1, j) = 100;
                                penjal(i - 1, j) = penjal(i, j);
                                penjal(i, j) = penjal(i + 1, j);
                                penjal(i + 1, j) = 0;
                            elseif kanan
                                jal(i + 2, j) = jal(i + 1, j);
                                jal(i + 1, j) = jal(i, j);
                                jal(i, j) = 100;
                                penjal(i + 2, j) = penjal(i + 1, j);
                                penjal(i + 1, j) = penjal(i, j);
                                penjal(i, j) = 0;
                            end

                        end

                    end

                end

            catch ME
                %indeks terlalu besar
            end

        end

    end

    j_kendaraan = penjal;
    s_kendaraan = jal;
end
