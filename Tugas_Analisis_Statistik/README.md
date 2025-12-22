# Tugas Analisis Statistik: Deskriptif, Korelasi, dan Regresi

## 1. Informasi Penyusun

- **Nama:** `[ANAK AGUNG RATIH HARDI MAHESWARI]`
- **NIM:** `[2515091021]`
- **Program Studi:** `[SISTEM INFORMASI]`
- **Mata Kuliah:** Statistika dan Probabilitas

---

## 2. Deskripsi Proyek

Dataset yang digunakan dalam analisis ini adalah data startup SaaS yang terdiri dari 650 observasi dengan 6 variabel, yang merepresentasikan karakteristik kinerja dan pelanggan dari berbagai startup. Dalam penelitian ini, variabel yang digunakan adalah Pendapatan_Tahunan_Miliar_IDR, Biaya_Akuisisi_Pelanggan_Juta_IDR, dan Nilai_Pelanggan_Juta_IDR.

Pendapatan_Tahunan_Miliar_IDR menggambarkan total pendapatan startup dalam satu tahun, Biaya_Akuisisi_Pelanggan_Juta_IDR menunjukkan biaya yang dikeluarkan perusahaan untuk memperoleh satu pelanggan, sedangkan Nilai_Pelanggan_Juta_IDR merepresentasikan nilai ekonomi pelanggan bagi perusahaan.

Tujuan dari analisis ini adalah untuk memahami karakteristik data melalui statistik deskriptif, serta menganalisis hubungan antara biaya akuisisi pelanggan dan nilai pelanggan terhadap pendapatan tahunan startup. Hasil analisis diharapkan dapat memberikan gambaran mengenai efisiensi strategi akuisisi pelanggan dan kontribusinya terhadap pendapatan perusahaan.

---

## 3. Struktur Proyek

Proyek ini diorganisir ke dalam beberapa folder:
- `/data`: Berisi dataset mentah yang digunakan untuk analisis.
- `/scripts`: Berisi semua skrip R yang digunakan dalam analisis, diurutkan berdasarkan alur kerja.
- `/results`: Berisi output dari analisis, seperti plot, gambar, atau tabel ringkasan.

---

## 4. Cara Menjalankan Analisis

Untuk mereproduksi hasil analisis ini, ikuti langkah-langkah berikut:
1. Pastikan Anda memiliki R dan RStudio terinstal.
2. Buka proyek R ini di RStudio.
3. Instal paket yang diperlukan dengan menjalankan perintah berikut di konsol R:
   ```R
   # install.packages(c("tidyverse", "corrplot", "knitr"))
   ```
4. Jalankan skrip di dalam folder `/scripts` secara berurutan, mulai dari `01_data_preparation.R` hingga `05_analisis_regresi.R`.

---

## 5. Hasil dan Interpretasi

Di bagian ini, mahasiswa diharapkan untuk menyajikan dan menginterpretasikan hasil dari setiap tahap analisis.

### 5.1. Statistik Deskriptif
- **Tabel Ringkasan**
  Tabel Ringkasan:

**Variabel**                          **Mean**	**Median**  **Modus**
Pendapatan_Tahunan_Miliar_IDR         	31.88	     31.30	     1.87
Biaya_Akuisisi_Pelanggan_Juta_IDR	   33.50	     33.08	     3.21
Nilai_Pelanggan_Juta_IDR	           100.02  	  98.71	     10.11

**NOTE** ( pada analisis deskriptif ini saya menggunakan 2 metode untuk mencari nilai mean, median, dan modus, metode pertama dengan saya mencari secara manual yang menggunakan script yang menginput variabel satu per satu, lalu metode kedua saya menggunakan shorcut dengan 1 script bisa mendapat mean, median, dan modus dari 3 variabel sekaligus, dan hasilnya sama seperti cara manual )
**INTERPRETASI**
1. Pendapatan Tahunan (Miliar IDR)
Rata-rata (Mean): 31,88 Miliar IDR
Nilai Tengah (Median): 31,30 Miliar IDR
Nilai Paling Sering Muncul (Modus): 1,87 Miliar IDR

Interpretasi:
Rata-rata pendapatan tahunan berada pada 31,88 Miliar IDR dengan nilai tengah 31,30 Miliar IDR, menunjukkan distribusi data yang relatif simetris. Namun, nilai modus yang jauh lebih rendah (1,87 Miliar IDR) mengindikasikan bahwa sebagian besar perusahaan memiliki pendapatan tahunan yang rendah. Perbedaan signifikan antara mean dan modus menunjukkan adanya beberapa perusahaan dengan pendapatan sangat tinggi yang menarik nilai rata-rata ke atas.

2. Biaya Akuisisi Pelanggan (Juta IDR)
Rata-rata (Mean): 33,50 Juta IDR
Nilai Tengah (Median): 33,08 Juta IDR
Nilai Paling Sering Muncul (Modus): 3,21 Juta IDR

Interpretasi:
Nilai mean (33,50 Juta IDR) dan median (33,08 Juta IDR) yang cukup berdekatan menandakan distribusi biaya akuisisi pelanggan yang seimbang secara umum. Namun, modus yang jauh lebih rendah (3,21 Juta IDR) menunjukkan bahwa nilai biaya akuisisi yang paling sering terjadi berada pada tingkat yang rendah. Hal ini mengindikasikan adanya variasi data yang signifikan, di mana sebagian besar pelanggan diperoleh dengan biaya rendah, tetapi terdapat beberapa kasus akuisisi dengan biaya yang sangat tinggi.

3. Nilai Pelanggan (Juta IDR)
Rata-rata (Mean): 100,02 Juta IDR
Nilai Tengah (Median): 98,71 Juta IDR
Nilai Paling Sering Muncul (Modus): 10,11 Juta IDR

Interpretasi:
Distribusi nilai pelanggan mendekati simetris dengan mean (100,02 Juta IDR) dan median (98,71 Juta IDR) yang hampir sama. Namun, modus yang sangat rendah (10,11 Juta IDR) mengisyaratkan bahwa mayoritas pelanggan memiliki nilai ekonomi yang rendah. Perbedaan besar antara modus dengan mean dan median menunjukkan keberadaan segmen kecil pelanggan dengan nilai sangat tinggi yang secara signifikan meningkatkan nilai rata-rata keseluruhan.


- **Visualisasi (Histogram/Boxplot):**
  - *Sematkan gambar plot dari folder /results...*
  - *Interpretasi:* Jelaskan wawasan apa yang Anda dapatkan dari bentuk distribusi data.

### 5.2. Uji Normalitas
- **Hasil Uji Shapiro-Wilk:**
  - *Nilai p-value...*
  - *Interpretasi:* Apakah data Anda terdistribusi normal berdasarkan hasil uji? Apa implikasinya?
- **Plot Q-Q:**
  - *Sematkan gambar plot dari folder /results...*
  - *Interpretasi:* Apakah titik-titik data mengikuti garis lurus? Apa artinya?

### 5.3. Analisis Korelasi
- **Nilai Koefisien Korelasi:**
  - *Nilai r...*
  - *Interpretasi:* Seberapa kuat dan apa arah hubungan antara dua variabel yang Anda uji? (misalnya, korelasi positif kuat, negatif lemah, atau tidak ada korelasi).
- **Visualisasi (Scatter Plot):**
  - *Sematkan gambar plot dari folder /results...*
  - *Interpretasi:* Apakah pola pada scatter plot mendukung hasil koefisien korelasi?

### 5.4. Analisis Regresi
- **Model Regresi:**
  - *Persamaan regresi: Y = b0 + b1*X*
  - *Interpretasi:* Jelaskan arti dari koefisien intercept (b0) dan slope (b1) dalam konteks data Anda.
- **Evaluasi Model (R-squared):**
  - *Nilai R-squared...*
  - *Interpretasi:* Berapa persen variasi dari variabel dependen yang dapat dijelaskan oleh model regresi Anda?
- **Visualisasi (Garis Regresi pada Scatter Plot):**
  - *Sematkan gambar plot dari folder /results...*
  - *Interpretasi:* Jelaskan bagaimana garis regresi merepresentasikan hubungan antara variabel.

---

## 6. Kesimpulan

Rangkum temuan utama dari analisis Anda dalam beberapa kalimat. Apa wawasan paling penting yang Anda peroleh?
