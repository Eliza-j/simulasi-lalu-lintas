# Overview

Sebuah aplikasi simulasi arus lalu lintas menggunakan konsep Cellular Automata, ditulis dalam bahasa Octave. Simulasi terdiri atas array nx4, dengan panjang n satuan dan lebar 4 satuan. Setiap sel di array merepresentasikan sebuah petak jalan berukuran 5x5 meter^2. Kendaraan roda dua direpresentasikan dengan huruf "m", dan berukuran satu petak sebagai pertimbangan jarak aman dengan kendaraan lain. Kendaraan roda 4 direpresentasikan dengan huruf "M", dan berukuran 2 petak. Setiap kendaraan memiliki kecepatan tertentu, yang dapat naik atau turun berdasarkan seberapa kosongnya jalan dan apakah ada kendaraan di depannya. "." merepresentasikan petak jalan kosong. Setiap sel memiliki kondisi awal yang ditentukan secara acak di awal simulasi, dan akan merubah kondisinya berdasarkan kondisi sel tetangga dan aturan yang telah ditetapkan.

Parameter yang diambil sebagai input adalah:

1. Panjang jalan (meter)
2. Kepadatan jalan (berapa mobil/motor yang ada di jalan, berdasarkan ukuran jalan)
3. Persentase kendaraan roda dua (%)
4. Kecenderungan kendaraan berpindah jalur (%)
5. Kecenderungan pengemudi memperlambat kendaraan (%)
6. Kecepatan maksimal yang diizinkan (KM/Jam)

Simulasi dijalankan secara iteratif, di mana satu iterasi menggambarkan kondisi jalan setelah 1 detik. Simulasi dapat dijalankan berulang-ulang untuk mendapatkan data simulasi, berdasarkan parameter-parameter yang diubah. Kecepatan setiap kendaraan dicatat dalam setiap iterasi, dan akan dirata-ratakan pada akhir simulasi.

## How to Use

Software:
Octave 6.2.0

Simulasi bisa dijalankan melalui GUI menggunakan `mainGUI.m`, atau juga melalui command line menggunakan `simulasiLaluLintas.m`. Untuk menjalankan sejumlah simulasi dalam waktu bersamaan, maka gunakan `simulasiLaluLintasBatch.m` melalui command line.

Setiap simulasi, pengguna harus mendefinisikan parameter-parameter yang akan digunakan. Hasil simulasi dapat diakses melalui folder `log`.

## Gallery
![alt text](https://github.com/Eliza-j/simulasi-lalu-lintas/blob/main/screenshots/contoh-simulasi.jpg)
*Tampilan jalan yang disimulasikan*

![alt text](https://github.com/Eliza-j/simulasi-lalu-lintas/blob/main/screenshots/hasil-simulasi.jpg)
*Hasil satu simulasi*

![alt text](https://github.com/Eliza-j/simulasi-lalu-lintas/blob/main/screenshots/tampilan-gui.jpg)
*Tampilan GUI*


## Reference

Aplikasi ini dibangun berdasarkan skripsi Abduh Riski yang berjudul "Simulasi arus lalu lintas dengan cellular automata", dengan sejumlah modifikasi.
