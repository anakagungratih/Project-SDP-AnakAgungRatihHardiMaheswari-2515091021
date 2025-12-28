# =================================================================
# SKRIP 2: ANALISIS STATISTIK DESKRIPTIF
# =================================================================
#
# TUJUAN:
# 1. Menghitung ukuran pemusatan data (mean, median, modus).
# 2. Menghitung ukuran sebaran data (standar deviasi, range, kuartil).
# 3. Membuat visualisasi data (histogram dan boxplot) untuk memahami distribusi.
#
# INSTRUKSI:
# 1. Pastikan Anda sudah menjalankan skrip '01_data_preparation.R' terlebih dahulu.
# 2. Ganti 'nama_kolom_numerik' dengan nama kolom dari dataset Anda yang ingin dianalisis.
# 3. Simpan plot yang dihasilkan ke dalam folder 'results'.
# =================================================================

# -----------------------------------------------------------------
# Langkah 0: Persiapan
# -----------------------------------------------------------------
# Jika variabel 'data_bersih' belum ada, jalankan skrip 01 terlebih dahulu.
if (!exists("data_bersih")) {
  source("data_bersih.RData")
  print("Menjalankan skrip 01_data_preparation.R.")
}

# Ganti dengan nama kolom numerik yang ingin Anda analisis dari dataset Anda.
# Contoh: kolom_analisis <- "harga_rumah"
kolom_analisis <- "Pendapatan_Tahunan_Miliar_IDR" 

# Pastikan kolom yang dipilih ada di dalam data
if(!"Pendapatan_Tahunan_Miliar_IDR" %in% names(data_bersih)) {
  stop(paste(
    "Kolom 'Pendapatan_Tahunan_Miliar_IDR' tidak ditemukan dalam data."
  ))
}

# -----------------------------------------------------------------
# Langkah 1: Ukuran Pemusatan Data
# -----------------------------------------------------------------
# Mean (Rata-rata)
mean_value <- mean(data_bersih[["Pendapatan_Tahunan_Miliar_IDR"]], na.rm = TRUE)
print(paste(
  "Mean dari Pendapatan_Tahunan_Miliar_IDR:",
  round(mean_value, 2)
))

# Median (Nilai Tengah)
median_value <- median(data_bersih[["Pendapatan_Tahunan_Miliar_IDR"]], na.rm = TRUE)
print(paste("Median dari", "Pendapatan_Tahunan_Miliar_IDR", ":", round(median_value, 2)))

# Modus (Nilai yang Paling Sering Muncul)
# R tidak memiliki fungsi modus bawaan, jadi kita bisa membuatnya sendiri.
get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
mode_value <- get_mode(data_bersih[["Pendapatan_Tahunan_Miliar_IDR"]])
print(paste("Modus dari", "Pendapatan_Tahunan_Miliar_IDR", ":", mode_value))


#SHORTCUT (ini code yang saya pribadi tambahkan, untuk mempermudah jika ingin menghitung banyak variabel)
vars_numerik <- c(
  "Pendapatan_Tahunan_Miliar_IDR",
  "Biaya_Akuisisi_Pelanggan_Juta_IDR",
  "Nilai_Pelanggan_Juta_IDR",
  "Tingkat_Churn_Persen"
)

stat_deskriptif <- data.frame(
  Variabel = vars_numerik,
  Mean = sapply(vars_numerik, function(v)
    round(mean(data_bersih[[v]], na.rm = TRUE), 2)
  ),
  Median = sapply(vars_numerik, function(v)
    round(median(data_bersih[[v]], na.rm = TRUE), 2)
  ),
  Modus = sapply(vars_numerik, function(v)
    get_mode(data_bersih[[v]])
  )
)

stat_deskriptif

# ============================================
# SCRIPT TABEL DESKRIPTIF 
# ============================================

# Data yg sudah didapat
data_tabel <- data.frame(
  Variabel = c(
    "Pendapatan_Tahunan_Miliar_IDR",
    "Biaya_Akuisisi_Pelanggan_Juta_IDR",
    "Nilai_Pelanggan_Juta_IDR", 
    "Tingkat_Churn_Persen"
  ),
  Mean = c(31.88, 33.50, 100.02, -14.79),
  Median = c(31.30, 33.08, 98.71, -14.39),
  Modus = c(1.87, 3.21, 10.11, 13.55)
)

# Tampilin tabel dasar
print(data_tabel)

# ============================================
# BUAT TABEL YANG CANTIK 
# ============================================
library(kableExtra)

tabel_cantik <- data_tabel %>%
  kable(
    caption = "Tabel Statistik Deskriptif",
    align = c('l', 'c', 'c', 'c'),
    col.names = c("Variabel", "Mean", "Median", "Modus")
  ) %>%
  kable_styling(
    bootstrap_options = c("striped", "hover"),
    full_width = FALSE,
    font_size = 14
  ) %>%
  row_spec(0, bold = TRUE, background = "#2c3e50", color = "white") %>%
  column_spec(1, bold = TRUE)

# Tampilin di RStudio
print(tabel_cantik)

# Simpen jadi gambar PNG
save_kable(tabel_cantik, "tabel_deskriptif_hasil.png")

# ============================================
# versi simpelnya
# ============================================
cat("\n")
cat("="*60, "\n")
cat("TABEL STATISTIK DESKRIPTIF\n")
cat("="*60, "\n")
cat(sprintf("%-40s %10s %10s %10s\n", "Variabel", "Mean", "Median", "Modus"))
cat("-"*60, "\n")
cat(sprintf("%-40s %10.2f %10.2f %10.2f\n", 
            "Pendapatan_Tahunan_Miliar_IDR", 31.88, 31.30, 1.87))
cat(sprintf("%-40s %10.2f %10.2f %10.2f\n", 
            "Biaya_Akuisisi_Pelanggan_Juta_IDR", 33.50, 33.08, 3.21))
cat(sprintf("%-40s %10.2f %10.2f %10.2f\n", 
            "Nilai_Pelanggan_Juta_IDR", 100.02, 98.71, 10.11))
cat(sprintf("%-40s %10.2f %10.2f %10.2f\n", 
            "Tingkat_Churn_Persen", -14.79, -14.39, 13.55))
cat("="*60, "\n")



# -----------------------------------------------------------------
# Langkah 2: Ukuran Sebaran Data
# -----------------------------------------------------------------
# Standar Deviasi ()
sd_value <- sd(data_bersih[["Pendapatan_Tahunan_Miliar_IDR"]], na.rm = TRUE)
print(paste("Standar Deviasi dari", "Pendapatan_Tahunan_Miliar_IDR", ":", round(sd_value, 2)))

# Range (Jangkauan)
range_value <- range(data_bersih[["Pendapatan_Tahunan_Miliar_IDR"]], na.rm = TRUE)
print(paste("Range dari", "Pendapatan_Tahunan_Miliar_IDR", ":", range_value[1], "-", range_value[2]))

# Kuartil dan Ringkasan 5 Angka (Min, Q1, Median, Q3, Max)
summary_value <- summary(data_bersih[["Pendapatan_Tahunan_Miliar_IDR"]])
print(paste("Ringkasan 5 Angka untuk", "Pendapatan_Tahunan_Miliar_IDR", ":"))
print(summary_value)


#=============================================
#SHORTCUT UNTUK KE 4 VARIABEL BESERTA TABELNYA
#=============================================

vars_numerik <- c(
  "Pendapatan_Tahunan_Miliar_IDR",
  "Biaya_Akuisisi_Pelanggan_Juta_IDR", 
  "Nilai_Pelanggan_Juta_IDR",
  "Tingkat_Churn_Persen"
)

# Nama untuk tampilan tabel
nama_tampilan <- c(
  "Pendapatan Tahunan",
  "Biaya Akuisisi Pelanggan",
  "Nilai Pelanggan",
  "Tingkat Churn (%)"
)

# ============================================
# HITUNG STATISTIK SEBARAN
# ============================================

hasil_sebaran <- data.frame(
  Variabel = nama_tampilan,
  Std_Dev = sapply(vars_numerik, function(v) round(sd(data_bersih[[v]], na.rm = TRUE), 2)),
  Min = sapply(vars_numerik, function(v) round(min(data_bersih[[v]], na.rm = TRUE), 2)),
  Q1 = sapply(vars_numerik, function(v) round(quantile(data_bersih[[v]], 0.25, na.rm = TRUE), 2)),
  Median = sapply(vars_numerik, function(v) round(median(data_bersih[[v]], na.rm = TRUE), 2)),
  Q3 = sapply(vars_numerik, function(v) round(quantile(data_bersih[[v]], 0.75, na.rm = TRUE), 2)),
  Max = sapply(vars_numerik, function(v) round(max(data_bersih[[v]], na.rm = TRUE), 2))
)

# Ubah nama kolom
colnames(hasil_sebaran) <- c("Variabel", "Std. Dev", "Min", "Q1", "Median", "Q3", "Max")

# ============================================
# TAMPILKAN TABEL
# ============================================
library(webshot2)
data <- data.frame(
  "Variabel" = c("Pendapatan Tahunan (Miliar IDR)", 
                 "Biaya Akuisisi Pelanggan (Juta IDR)",
                 "Nilai Pelanggan (Juta IDR)", 
                 "Tingkat Churn (%)"),
  "Std. Dev" = c("19.79", "20.03", "59.86", "20.02"),
  "Min" = c("1.00", "2.56", "6.01", "-50.03"),
  "Q1" = c("14.31", "15.23", "45.66", "-32.21"),
  "Median" = c("31.30", "33.08", "98.71", "-14.39"),
  "Q3" = c("49.04", "50.92", "152.08", "3.43"),
  "Max" = c("66.89", "68.77", "205.46", "15.78")
)

# Buat tabel
tabel <- kable(data, align = c('l', 'c', 'c', 'c', 'c', 'c', 'c')) %>%
  kable_styling(full_width = TRUE, font_size = 16)

print(tabel)


# -----------------------------------------------------------------
# Langkah 3: Visualisasi Data
# -----------------------------------------------------------------
# A. Histogram
# Histogram membantu melihat bentuk distribusi data.
hist_plot <- ggplot(data_bersih, aes_string(x = "Pendapatan_Tahunan_Miliar_IDR")) +
  geom_histogram(bins = 20, fill = "skyblue", color = "white") +
  geom_vline(aes(xintercept = mean_value), color = "red", linetype = "dashed", size = 1) +
  labs(
    title = paste("Histogram dari", "Pendapatan_Tahunan_Miliar_IDR"),
    subtitle = paste("Garis merah putus-putus menunjukkan Mean =", round(mean_value, 2)),
    x = kolom_analisis,
    y = "Frekuensi"
  ) +
  theme_minimal()

print(hist_plot)

# Menyimpan histogram ke folder 'results'
ggsave(
  filename = paste0(
    "C:/Users/anaka/OneDrive/Desktop/Semester 1/Statistika dan Probabilitas/Tugas_Analisis_Statistik/results/histogram_",
    "Pendapatan_Tahunan_Miliar_IDR",
    ".png"
  ),
  plot = hist_plot,
  width = 8,
  height = 6
)
print(paste("Histogram disimpan di folder 'results' dengan nama histogram_", kolom_analisis, ".png", sep=""))


#histogram Biaya_Akuisisi_Pelanggan_Juta_IDR
mean_value <- mean(data_bersih$Biaya_Akuisisi_Pelanggan_Juta_IDR, na.rm = TRUE)

hist_plot <- ggplot(data_bersih, aes_string(x = "Biaya_Akuisisi_Pelanggan_Juta_IDR")) +
  geom_histogram(bins = 20, fill = "yellow", color = "white") +
  geom_vline(aes(xintercept = mean_value), color = "red", linetype = "dashed", size = 1) +
  labs(
    title = paste("Histogram dari", "Biaya_Akuisisi_Pelanggan_Juta_IDR"),
    subtitle = paste("Garis merah putus-putus menunjukkan Mean =", round(mean_value, 2)),
    x = "Biaya_Akuisisi_Pelanggan_Juta_IDR",
    y = "Frekuensi"
  ) +
  theme_minimal()

print(hist_plot)

#simpan histonya
ggsave(
  filename = paste0(
    "C:/Users/anaka/OneDrive/Desktop/Semester 1/Statistika dan Probabilitas/Tugas_Analisis_Statistik/results/histogram_",
    "Biaya_Akuisisi_Pelanggan_Juta_IDR",
    ".png"
  ),
  plot = hist_plot,
  width = 8,
  height = 6
)
print(paste("Histogram disimpan di folder 'results' dengan nama histogram_", "Biaya_Akuisisi_Pelanggan_Juta_IDR", ".png", sep=""))


#histo Nilai_Pelanggan_Juta_IDR

mean_value <- mean(data_bersih$Nilai_Pelanggan_Juta_IDR, na.rm = TRUE)

hist_plot <- ggplot(data_bersih, aes_string(x = "Nilai_Pelanggan_Juta_IDR")) +
  geom_histogram(bins = 20, fill = "lightgreen", color = "white") +
  geom_vline(aes(xintercept = mean_value), color = "red", linetype = "dashed", size = 1) +
  labs(
    title = paste("Histogram dari", "Nilai_Pelanggan_Juta_IDR"),
    subtitle = paste("Garis merah putus-putus menunjukkan Mean =", round(mean_value, 2)),
    x = "Nilai_Pelanggan_Juta_IDR",
    y = "Frekuensi"
  ) +
  theme_minimal()

print(hist_plot)

#simpan histo nya
ggsave(
  filename = paste0(
    "C:/Users/anaka/OneDrive/Desktop/Semester 1/Statistika dan Probabilitas/Tugas_Analisis_Statistik/results/histogram_",
    "Nilai_Pelanggan_Juta_IDR",
    ".png"
  ),
  plot = hist_plot,
  width = 8,
  height = 6
)
print(paste("Histogram disimpan di folder 'results' dengan nama histogram_", "Nilai_Pelanggan_Juta_IDR", ".png", sep=""))



#histo Tingkat_churn_Persen

mean_value <- mean(data_bersih$Tingkat_Churn_Persen, na.rm = TRUE)
median_value <- median(data_bersih$Tingkat_Churn_Persen, na.rm = TRUE)

# Histogram yang benar
hist_plot_correct <- ggplot(data_bersih, aes(x = Tingkat_Churn_Persen)) +
  geom_histogram(
    bins = 30, 
    fill = "lightblue", 
    color = "black",
    alpha = 0.7
  ) +
  # Garis mean (MERAH)
  geom_vline(
    aes(xintercept = mean_value), 
    color = "red", 
    linetype = "dashed", 
    size = 1.2,
    show.legend = TRUE
  ) +
  # Garis median (HIJAU)
  geom_vline(
    aes(xintercept = median_value), 
    color = "darkgreen", 
    linetype = "solid", 
    size = 1,
    alpha = 0.7
  ) +
  labs(
    title = "Histogram Distribusi Tingkat Churn (%)",
    subtitle = paste(
      "Mean (garis merah) =", round(mean_value, 2), "% | ",
      "Median (garis hijau) =", round(median_value, 2), "%"
    ),
    x = "Tingkat Churn (%)",
    y = "Frekuensi"
  ) +
  # TENTUKAN BATAS X YANG SESUAI DENGAN DATA
  scale_x_continuous(
    limits = c(
      min(data_bersih$Tingkat_Churn_Persen, na.rm = TRUE) - 5,
      max(data_bersih$Tingkat_Churn_Persen, na.rm = TRUE) + 5
    ),
    breaks = seq(
      floor(min(data_bersih$Tingkat_Churn_Persen, na.rm = TRUE)),
      ceiling(max(data_bersih$Tingkat_Churn_Persen, na.rm = TRUE)),
      by = 10
    )
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    plot.subtitle = element_text(hjust = 0.5, size = 11),
    panel.grid.minor = element_blank()
  )

print(hist_plot_correct)

#simpan histo nya
save_path <- paste0(
  "C:/Users/anaka/OneDrive/Desktop/Semester 1/Statistika dan Probabilitas/Tugas_Analisis_Statistik/results/histogram_Tingkat_Churn_Persen.png"
)

ggsave(
  filename = save_path,
  plot = hist_plot,
  width = 8,
  height = 6,
  dpi = 300
)

cat("✅ Histogram berhasil disimpan di:\n")
cat("   ", save_path, "\n")


# B. Boxplot
# Boxplot berguna untuk mengidentifikasi pencilan (outliers) dan melihat sebaran kuartil.
box_plot <- ggplot(data_bersih, aes_string(y = "Pendapatan_Tahunan_Miliar_IDR")) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  labs(
    title = paste("Boxplot dari", "Pendapatan_Tahunan_Miliar_IDR"),
    y = "Pendapatan_Tahunan_Miliar_IDR"
  ) +
  theme_minimal()

print(box_plot)

# Menyimpan boxplot ke folder 'results'
ggsave(
  filename = paste0(
    "C:/Users/anaka/OneDrive/Desktop/Semester 1/Statistika dan Probabilitas/Tugas_Analisis_Statistik/results/boxplot_",
    "Pendapatan_Tahunan_Miliar_IDR",
    ".png"
  ),
  plot = box_plot,
  width = 6,
  height = 8
)
print(paste("Boxplot disimpan di folder 'results' dengan nama boxplot_", "Pendapatan_Tahunan_Miliar_IDR", ".png", sep=""))

#Boxplot Akuisisi Pelanggan (JUTA IDR)
boxplot_correct <- ggplot(data_bersih, aes(y = Biaya_Akuisisi_Pelanggan_Juta_IDR)) +
  geom_boxplot(fill = "lightblue", color = "darkblue", outlier.color = "red") +
  labs(
    title = "Boxplot Biaya Akuisisi Pelanggan",
    subtitle = paste("Range:", round(min(data_bersih$Biaya_Akuisisi_Pelanggan_Juta_IDR, na.rm=TRUE), 2), 
                     "-", round(max(data_bersih$Biaya_Akuisisi_Pelanggan_Juta_IDR, na.rm=TRUE), 2), "Juta IDR"),
    y = "Biaya Akuisisi (Juta IDR)",
    x = ""
  ) +
  theme_minimal() +
  theme(axis.text.x = element_blank())

print(boxplot_correct)


#boxplot nilai pelanggan 
boxplot_nilai <- ggplot(data_bersih, aes(y = Nilai_Pelanggan_Juta_IDR)) +
  geom_boxplot(
    fill = "#3498db",
    color = "#2c3e50",
    outlier.color = "#e74c3c",
    outlier.size = 2,
    alpha = 0.7
  ) +
  labs(
    title = "Boxplot Nilai Pelanggan",
    subtitle = paste(
      "Range:", round(min(data_bersih$Nilai_Pelanggan_Juta_IDR, na.rm = TRUE), 2),
      "-", round(max(data_bersih$Nilai_Pelanggan_Juta_IDR, na.rm = TRUE), 2), "Juta IDR"
    ),
    y = "Nilai Pelanggan (Juta IDR)",
    x = ""
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    plot.subtitle = element_text(hjust = 0.5, size = 10),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  ) +
  # FIX: Tambah median text tanpa stat_summary
  annotate(
    "text",
    x = 0.5,  # Posisi x di tengah
    y = median(data_bersih$Nilai_Pelanggan_Juta_IDR, na.rm = TRUE),
    label = paste("Median:", round(median(data_bersih$Nilai_Pelanggan_Juta_IDR, na.rm = TRUE), 2)),
    vjust = -1,
    size = 3.5,
    color = "#2c3e50"
  )

print(boxplot_nilai)

#boxplot nilai churn

boxplot_churn <- ggplot(data_bersih, aes(y = Tingkat_Churn_Persen)) +
  geom_boxplot(
    fill = "#2ecc71",
    color = "#27ae60",
    outlier.color = "#e74c3c",
    outlier.size = 2,
    alpha = 0.7
  ) +
  labs(
    title = "Boxplot Tingkat Churn",
    subtitle = paste(
      "Range:", round(min(data_bersih$Tingkat_Churn_Persen, na.rm = TRUE), 2),
      "-", round(max(data_bersih$Tingkat_Churn_Persen, na.rm = TRUE), 2), "%"
    ),
    y = "Tingkat Churn (%)",
    x = ""
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    plot.subtitle = element_text(hjust = 0.5, size = 10),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  ) +
  # Garis horizontal di 0%
  geom_hline(
    yintercept = 0,
    linetype = "dashed",
    color = "#7f8c8d",
    alpha = 0.5,
    size = 0.8
  ) +
  # Label garis 0%
  annotate(
    "text",
    x = 0.5,
    y = 1,
    label = "Churn = 0%",
    color = "#7f8c8d",
    size = 3
  ) +
  # FIX: Tambah median text tanpa stat_summary
  annotate(
    "text",
    x = 0.5,
    y = median(data_bersih$Tingkat_Churn_Persen, na.rm = TRUE),
    label = paste("Median:", round(median(data_bersih$Tingkat_Churn_Persen, na.rm = TRUE), 2), "%"),
    vjust = -1,
    size = 3.5,
    color = "#27ae60"
  )

print(boxplot_churn)

# Pesan akhir
print("Analisis deskriptif selesai. Jangan lupa untuk menginterpretasikan hasilnya di file README.md.")
