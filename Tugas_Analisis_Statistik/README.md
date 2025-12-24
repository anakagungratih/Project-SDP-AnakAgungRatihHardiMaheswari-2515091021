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

**Variabel**                        
Pendapatan_Tahunan_Miliar_IDR         
Biaya_Akuisisi_Pelanggan_Juta_IDR	   
Nilai_Pelanggan_Juta_IDR	           

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


**Interpretasi Ukuran Sebaran Data**
- Pendapatan Tahunan (Miliar IDR)
- Ringkasan Ukuran Sebaran:
- Range (Rentang): 1.00 - 66.89 Miliar IDR
- Standar Deviasi: 19.79 Miliar IDR
   - Ringkasan 5 Angka:
   - Minimum: 1.00 Miliar IDR
   - Kuartil 1 (Q1): 14.31 Miliar IDR
   - Median (Q2): 31.30 Miliar IDR
   - Kuartil 3 (Q3): 49.04 Miliar IDR
   - Maksimum: 66.89 Miliar IDR
   - Rata-rata (Mean): 31.88 Miliar IDR

Interpretasi:
1. Rentang Data (Range):
Data pendapatan tahunan memiliki rentang yang sangat lebar, mulai dari 1.00 Miliar IDR hingga 66.89 Miliar IDR. Rentang sebesar 65.89 Miliar IDR menunjukkan variasi yang ekstrem dalam pendapatan perusahaan-perusahaan dalam dataset.

3. Standar Deviasi:
Standar deviasi sebesar 19.79 Miliar IDR mengindikasikan tingkat penyebaran data yang tinggi. Nilai ini menunjukkan bahwa pendapatan tahunan perusahaan-perusahaan dalam sampel cenderung menyebar cukup jauh dari nilai rata-rata (31.88 Miliar IDR).

4. Analisis Berdasarkan Kuartil:
- 50% data terkonsentrasi di tengah: Data antara Q1 (14.31) dan Q3 (49.04) mencakup 50% observasi tengah, dengan rentang 34.73 Miliar IDR.
- Distribusi tidak simetris: Jarak antara Q1-Median (17.0) lebih kecil dari jarak Median-Q3 (17.74), menunjukkan distribusi yang sedikit miring ke kanan (right-skewed).
- 25% data dengan pendapatan rendah: Seperempat perusahaan memiliki pendapatan di bawah 14.31 Miliar IDR.
- 25% data dengan pendapatan tinggi: Seperempat perusahaan memiliki pendapatan di atas 49.04 Miliar IDR.

4. Implikasi Bisnis:
- Heterogenitas tinggi: Industri menunjukkan tingkat ketidaksetaraan pendapatan yang signifikan antar perusahaan.
- Segmentasi jelas: Terdapat perbedaan mencolok antara perusahaan dengan pendapatan rendah (di bawah 14.31 Miliar IDR) dan perusahaan dengan pendapatan tinggi (di atas 49.04 Miliar IDR).
- Risiko dalam estimasi: Standar deviasi yang besar menunjukkan bahwa menggunakan rata-rata sebagai estimasi untuk perusahaan individual bisa sangat tidak akurat.

**Kesimpulan**: Data pendapatan tahunan menunjukkan variasi yang sangat tinggi dengan distribusi yang cenderung miring ke kanan. Sebagian besar perusahaan memiliki pendapatan relatif rendah, namun terdapat beberapa perusahaan dengan pendapatan sangat tinggi yang menarik rata-rata keseluruhan ke atas.

- **Visualisasi (Histogram/Boxplot): disini saya menggunakan variabel pendapatan tahunan saja**

Interpretasi **Histogram** Pendapatan Tahunan
Histogram distribusi Pendapatan Tahunan menunjukkan pola yang tidak simetris dan jelas miring ke kanan (right-skewed). Sebagian besar data, dengan frekuensi tertinggi mencapai sekitar 40 observasi, terkonsentrasi kuat pada rentang pendapatan rendah, yaitu antara 0 hingga 20 Miliar IDR. Setelah melewati titik tersebut, frekuensi observasi mulai menurun drastis.
Rata-rata (mean) pendapatan, yang ditunjukkan oleh garis merah putus-putus pada nilai 31.88 Miliar IDR, terletak jauh di sebelah kanan puncak distribusi. Posisi mean ini berada di area yang frekuensinya sudah jauh lebih rendah, yang secara visual mengkonfirmasi bahwa nilai rata-rata keseluruhan ditarik ke atas oleh keberadaan sejumlah kecil perusahaan dengan pendapatan yang sangat tinggi. Hanya sangat sedikit perusahaan yang tercatat memiliki pendapatan di atas 40 Miliar IDR, dan ekor histogram yang memanjang hingga mendekati 60 Miliar IDR mewakili outlier atau perusahaan-perusahaan berkinerja ekstrem.
Secara keseluruhan, histogram ini menggambarkan karakteristik industri yang didominasi oleh banyak perusahaan dengan skala pendapatan kecil hingga menengah, sementara hanya segelintir perusahaan besar yang menghasilkan pendapatan luar biasa tinggi, sehingga menciptakan kesenjangan yang signifikan dan membentuk distribusi yang tidak merata.

**Interpretasi Box Plot**
Boxplot menunjukkan distribusi data Pendapatan Tahunan yang sangat miring ke arah nilai tinggi (positively skewed). Kotak (box) utama, yang mewakili 50% data tengah (antara kuartil pertama Q1 dan kuartil ketiga Q3), terlihat sangat pendek dan terkompresi ke bagian bawah skala, tepat di sekitar atau sedikit di atas nilai nol. Hal ini mengindikasikan bahwa separuh dari perusahaan-perusahaan dalam data memiliki pendapatan yang terkonsentrasi pada rentang yang sangat rendah dan sempit.

Dari kotak tersebut, garis median (Q2) terlihat berada sangat dekat dengan dasar kotak, menguatkan kesimpulan bahwa sebagian besar nilai data berada di angka-angka rendah. Kemudian, dari kuartil ketiga (Q3) ke atas, terdapat "whisker" atau garis yang memanjang sangat jauh ke arah nilai positif. Panjang whisker atas yang ekstrem ini mewakili sebaran 25% data dengan pendapatan tertinggi, yang nilainya sangat berjauhan dari kelompok mayoritas.

### 5.2. Uji Normalitas
- **Hasil Uji Shapiro-Wilk:**
Nilai p-value: 1.497 × 10⁻¹⁴ (p-value ≈ 0.00000000000001497)

Interpretasi:
Nilai p-value yang sangat kecil (jauh di bawah 0.05) memberikan bukti statistik yang kuat untuk menolak hipotesis nol yang menyatakan bahwa data terdistribusi normal. Dengan kata lain, data Pendapatan_Tahunan_Miliar_IDR secara signifikan TIDAK terdistribusi normal. Implikasinya adalah metode statistik parametrik yang mengasumsikan distribusi normal (seperti uji-t, ANOVA, atau model regresi linear klasik) mungkin tidak sesuai untuk analisis data ini tanpa transformasi terlebih dahulu. Sebagai gantinya, dapat dipertimbangkan penggunaan metode non-parametrik atau melakukan transformasi data untuk mendekati distribusi normal.
- **Plot Q-Q:**
  - *Sematkan gambar plot dari folder /results...*
  - *Interpretasi:*
    Berdasarkan plot Q-Q yang ditampilkan, titik-titik data tidak mengikuti garis lurus diagonal dengan baik. Polanya menunjukkan penyimpangan yang sistematis dari garis normal teoritis. Titik-titik data di ekor kanan (nilai tinggi) dan kiri (nilai rendah) menyimpang jauh dari garis, membentuk pola kurva yang jelas. Hal ini mengindikasikan bahwa distribusi data memiliki ekor yang lebih panjang daripada distribusi normal, atau disebut right-skewed (miring ke kanan). Artinya, terdapat beberapa nilai ekstrem tinggi yang menarik mean ke kanan, sementara mayoritas data terkonsentrasi pada nilai-nilai yang lebih rendah. Pola ini konsisten dengan hasil uji Shapiro-Wilk yang menolak kenormalan data.

### 5.3. Analisis Korelasi
- **Nilai Koefisien Korelasi:**
 Nilai r (rho) = 0.997 (setelah pembulatan menjadi 0.997)

**Interpretasi**:
- Koefisien korelasi Spearman sebesar 0.997 menunjukkan hubungan positif yang sangat kuat antara Pendapatan_Tahunan_Miliar_IDR dan Nilai_Pelanggan_Juta_IDR. Nilai yang mendekati +1 ini mengindikasikan bahwa ketika pendapatan tahunan meningkat, nilai pelanggan juga cenderung meningkat secara hampir sempurna, dan sebaliknya.
- Arah hubungan yang positif berarti kedua variabel bergerak searah: perusahaan dengan pendapatan tahunan yang lebih tinggi juga cenderung memiliki nilai pelanggan yang lebih tinggi, dan perusahaan dengan pendapatan lebih rendah juga memiliki nilai pelanggan yang lebih rendah.

**Signifikansi Statistik:**
p-value < 2.2 × 10⁻¹⁶ (sangat mendekati nol)
Interpretasi:
Nilai p-value yang sangat kecil ini (jauh di bawah α = 0.05) memberikan bukti statistik yang sangat kuat untuk menolak hipotesis nol yang menyatakan tidak ada korelasi antara kedua variabel. Dengan demikian, korelasi yang diamati sangat signifikan secara statistik dan hampir pasti bukan disebabkan oleh kebetulan semata. Kita dapat yakin dengan tingkat kepercayaan yang sangat tinggi bahwa hubungan positif yang kuat ini juga ada dalam populasi asal data.
- **Visualisasi (Scatter Plot):**
  - *Sematkan gambar plot dari folder /results...*
  - **Interpretasi:**
Visualisasi scatter plot menunjukkan pola yang sangat jelas di mana titik-titik data membentuk tren linear positif yang hampir sempurna. Garis merah yang menunjukkan tren linear tampaknya akan melewati sebagian besar titik data dengan sangat baik, mengonfirmasi kekuatan hubungan yang diamati melalui koefisien korelasi.

Kesimpulan:
Terdapat korelasi positif yang sangat kuat dan signifikan secara statistik antara pendapatan tahunan perusahaan dan nilai pelanggannya. Hal ini dapat diinterpretasikan bahwa dalam konteks dataset ini, perusahaan dengan pendapatan yang lebih tinggi secara konsisten juga memiliki portofolio pelanggan dengan nilai ekonomi yang lebih tinggi, menunjukkan hubungan yang hampir deterministik antara kedua metrik kinerja ini.


### 5.4. Analisis Regresi
- **Model Regresi:**
- Persamaan regresi:
Nilai_Pelanggan_Juta_IDR = 3.57 + 3.02 × Pendapatan_Tahunan_Miliar_IDR
Interpretasi koefisien:
Intercept (b₀ = 3.57): Ketika pendapatan tahunan perusahaan adalah 0 Miliar IDR, model memprediksi nilai pelanggan sebesar 3.57 Juta IDR. Dalam konteks praktis, ini dapat diinterpretasikan sebagai nilai dasar atau nilai minimum pelanggan yang dimiliki perusahaan bahkan tanpa pendapatan (mungkin mewakili aset atau potensi pelanggan yang belum menghasilkan pendapatan).
- Slope (b₁ = 3.02): Setiap kenaikan 1 Miliar IDR pada pendapatan tahunan perusahaan, akan meningkatkan nilai pelanggan sebesar 3.02 Juta IDR. Koefisien positif ini menunjukkan hubungan proporsional yang sangat kuat antara pendapatan dan nilai pelanggan. Artinya, perusahaan yang menghasilkan pendapatan lebih tinggi tidak hanya memiliki pendapatan lebih besar, tetapi juga memiliki portofolio pelanggan yang bernilai lebih tinggi secara rata-rata.

- **Evaluasi Model (R-squared):**
- Nilai R-squared (Adj. R-squared = 0.994 atau 99.4%):
- Interpretasi: Nilai Adjusted R-squared sebesar 99.4% menunjukkan bahwa model regresi ini mampu menjelaskan 99.4% variasi     dalam nilai pelanggan berdasarkan variasi pendapatan tahunan. Ini adalah nilai yang sangat tinggi dan menunjukkan bahwa      model tersebut memiliki kekuatan prediktif yang luar biasa. Hanya sekitar 0.6% variasi nilai pelanggan yang tidak dapat      dijelaskan oleh pendapatan tahunan dalam model ini.

Model regresi linear sederhana ini menunjukkan hubungan yang hampir deterministik antara pendapatan tahunan dan nilai pelanggan perusahaan. Persamaan Nilai_Pelanggan = 3.57 + 3.02 × Pendapatan_Tahunan dapat digunakan untuk memprediksi nilai pelanggan dengan akurasi yang sangat tinggi (99.4%) berdasarkan pendapatan perusahaan. Dalam konteks bisnis, ini mengimplikasikan bahwa strategi untuk meningkatkan pendapatan perusahaan kemungkinan besar akan diiringi oleh peningkatan yang proporsional dalam nilai pelanggannya.

- **Visualisasi (Garis Regresi pada Scatter Plot):**
  - *Sematkan gambar plot dari folder /results...*
  - # **Interpretasi Visual Garis Regresi Linear**
**Plot scatter dengan garis regresi** secara visual mengkonfirmasi hubungan yang sangat kuat antara Pendapatan_Tahunan_Miliar_IDR (sumbu X) dan Nilai_Pelanggan_Juta_IDR (sumbu Y). Garis biru diagonal yang terbentuk menunjukkan tren linear positif yang hampir sempurna.
Garis regresi yang digambarkan (kemungkinan dengan persamaan Y = 3.57 + 3.02×X) mewakili hubungan rata-rata terbaik antara kedua variabel. Setiap titik pada garis ini menunjukkan nilai prediksi Nilai_Pelanggan untuk suatu nilai Pendapatan_Tahunan tertentu berdasarkan model statistik. Jarak vertikal antara titik-titik data aktual (scatter points) dengan garis regresi mewakili *residual* atau error prediksi model.
Visual menunjukkan bahwa hampir semua titik data berada sangat dekat dengan garis regresi, yang konsisten dengan nilai R-squared 99.4% yang sangat tinggi. Kemiringan (slope) garis yang curam sekitar 45 derajat mencerminkan koefisien regresi sebesar 3.02, yang berarti setiap peningkatan 1 unit pada pendapatan berkorespondensi dengan peningkatan sekitar 3 unit pada nilai pelanggan.
Secara praktis, garis ini dapat digunakan sebagai alat prediksi visual: untuk memperkirakan nilai pelanggan suatu perusahaan, cukup lihat posisi pendapatan tahunannya pada sumbu X, lalu tarik garis vertikal ke atas hingga bertemu garis regresi, kemudian tarik garis horizontal ke kiri untuk membaca prediksi nilai pelanggan pada sumbu Y. Keakuratan prediksi ini sangat tinggi, seperti yang ditunjukkan oleh kedekatan titik-titik data dengan garis.

---

## 6. Kesimpulan

Rangkum temuan utama dari analisis Anda dalam beberapa kalimat. Apa wawasan paling penting yang Anda peroleh?
