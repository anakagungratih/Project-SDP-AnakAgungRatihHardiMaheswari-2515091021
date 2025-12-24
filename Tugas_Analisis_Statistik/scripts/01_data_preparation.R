# =================================================================
# SKRIP 1: PERSIAPAN DATA
# =================================================================
#
# TUJUAN:
# 1. Memuat library/paket yang dibutuhkan.
# 2. Memuat dataset dari folder 'data'.
# 3. Memeriksa struktur dan ringkasan awal data.
# 4. Membersihkan data (jika diperlukan).
# =================================================================

# -----------------------------------------------------------------
# Langkah 1: Memuat Library
# -----------------------------------------------------------------
# install.packages("tidyverse") # jalankan sekali jika belum ada
library(tidyverse)

# -----------------------------------------------------------------
# Langkah 2: Memuat Dataset
# -----------------------------------------------------------------
# GANTI "nama_file_data.csv" dengan nama file CSV kamu yang asli

tryCatch({
  file_path <- "C:/Users/anaka/OneDrive/Desktop/Semester 1/Statistika dan Probabilitas/Tugas_Analisis_Statistik/data/data_startup_saas.csv"
  
  data <- read_csv(file_path)
  
  print(paste("Dataset berhasil dimuat dari:", file_path))
  
}, error = function(e) {
  print("Gagal memuat dataset. Pastikan:")
  print("1. Nama file sudah benar")
  print("2. File berada di folder 'data'")
  print("3. Ekstensi file adalah .csv")
  print(e)
})

# -----------------------------------------------------------------
# Langkah 3: Pemeriksaan Awal Data
# -----------------------------------------------------------------
print("Menampilkan 6 baris pertama data:")
print(head(data))

print("Menampilkan struktur data:")
glimpse(data)

print("Menampilkan ringkasan statistik data:")
summary(data)

# -----------------------------------------------------------------
# Langkah 4: Pembersihan Data
# -----------------------------------------------------------------
print("Jumlah missing values per kolom:")
print(colSums(is.na(data)))


# Untuk sementara diasumsikan data sudah bersih
data_bersih <- data

save(data_bersih, file = "data_bersih.RData")
# Atau untuk format CSV
write.csv(data_bersih, "data_bersih.csv", row.names = FALSE)

# Tampilkan working directory saat ini
getwd()

# Tampilkan file-file di direktori tersebut
list.files()

# Cek apakah file sudah tersimpan
file.exists("data_bersih.RData")
file.exists("data_bersih.csv")

print("Persiapan data selesai. Variabel 'data_bersih' siap digunakan.")
