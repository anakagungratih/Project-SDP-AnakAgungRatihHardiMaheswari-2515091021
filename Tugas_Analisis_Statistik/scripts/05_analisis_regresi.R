# =================================================================
# SKRIP 5: ANALISIS REGRESI LINEAR SEDERHANA
# =================================================================
# Langkah 0: Persiapan
# -----------------------------------------------------------------
if (!exists("data_bersih")) {
  source("01_data_preparation.R")
  print("Menjalankan skrip 01_data_preparation.R...")
}

var_dependen <- "Nilai_Pelanggan_Juta_IDR"
var_independen <- "Pendapatan_Tahunan_Miliar_IDR"

if(!var_dependen %in% names(data_bersih) || !var_independen %in% names(data_bersih)) {
  stop(paste("Satu atau kedua kolom ('", var_dependen, "', '", var_independen, "') tidak ditemukan. Periksa kembali nama kolom pada file 05_analisis_regresi.R"))
}

# -----------------------------------------------------------------
# Langkah 1: Membangun Model Regresi Linear
# -----------------------------------------------------------------
model_regresi <- lm(as.formula(paste("Nilai_Pelanggan_Juta_IDR", "~", "Pendapatan_Tahunan_Miliar_IDR")), data = data_bersih)

# -----------------------------------------------------------------
# Langkah 2: Melihat dan Menginterpretasikan Hasil Model
# -----------------------------------------------------------------
summary_model <- summary(model_regresi)

print("--- Ringkasan Model Regresi Linear ---")
print(summary_model)

print("--- Interpretasi Penting dari Model ---")

# A. Koefisien (Coefficients)
intercept_val <- coef(model_regresi)[1]
slope_val <- coef(model_regresi)[2]

print(paste("1. Persamaan Model: ", var_dependen, " = ", round(intercept_val, 2), " + ", round(slope_val, 2), " * ", var_independen))
print(paste("   - Intercept (b0) =", round(intercept_val, 2), "-> Nilai prediksi", var_dependen, "ketika", var_independen, "adalah 0."))
print(paste("   - Slope (b1) =", round(slope_val, 2), "-> Setiap kenaikan 1 unit pada", var_independen, ", diprediksi akan mengubah", var_dependen, "sebesar", round(slope_val, 2), "unit."))

# B. R-squared (Koefisien Determinasi)
adj_r_squared <- summary_model$adj.r.squared
print(paste("2. Adjusted R-squared =", round(adj_r_squared, 3), "atau", round(adj_r_squared * 100, 1), "%" ))
print(paste("   - Artinya,", round(adj_r_squared * 100, 1), "% variasi pada", var_dependen, "dapat dijelaskan oleh", var_independen, "melalui model ini."))

# -----------------------------------------------------------------
# Langkah 3: Visualisasi Garis Regresi
# -----------------------------------------------------------------
plot_regresi <- ggplot(data_bersih, aes_string(x = var_independen, y = var_dependen)) +
  geom_point(alpha = 0.6, color = "coral") +
  geom_smooth(method = "lm", se = TRUE, color = "blue") + # `se = TRUE` menampilkan confidence interval
  labs(
    title = "Garis Regresi Linear",
    subtitle = paste0(
      "Model: ", var_dependen, " ~ ", var_independen, "\n",
      "Adj. R-squared = ", round(adj_r_squared, 3)
    ),
    x = var_independen,
    y = var_dependen
  ) +
  theme_minimal()

print(plot_regresi)

# Menyimpan plot regresi ke folder 'results'
ggsave(
  filename = paste0("C:/Users/anaka/OneDrive/Desktop/Semester 1/Statistika dan Probabilitas/Tugas_Analisis_Statistik/results/regresi_", var_independen, "_vs_", var_dependen, ".png"),
  plot = plot_regresi,
  width = 8,
  height = 6
)
print(paste("Plot regresi disimpan di folder 'results'."))



#=================== analisis regresi 3 variabel ===============================

install.packages("car")
library(car)
# Langkah 1: Membuat Model Regresi
# Y  = Pendapatan_Tahunan_Miliar_IDR
# X1 = Biaya_Akuisisi_Pelanggan_Juta_IDR
# X2 = Nilai_Pelanggan_Juta_IDR
# -----------------------------------------------------------------

model_regresi <- lm(
  Pendapatan_Tahunan_Miliar_IDR ~ 
    Biaya_Akuisisi_Pelanggan_Juta_IDR + 
    Nilai_Pelanggan_Juta_IDR,
  data = data_bersih
)

# -----------------------------------------------------------------
# Langkah 2: Ringkasan Model
# -----------------------------------------------------------------
cat("\n========================================\n")
cat("RINGKASAN MODEL REGRESI\n")
cat("========================================\n")
summary_model <- summary(model_regresi)
print(summary_model)

# -----------------------------------------------------------------
# Langkah 3: Persamaan Regresi
# -----------------------------------------------------------------
coef_model <- coef(model_regresi)

b0 <- coef_model[1]
b1 <- coef_model[2]
b2 <- coef_model[3]

cat("\n========================================\n")
cat("PERSAMAAN REGRESI\n")
cat("========================================\n")
cat(
  paste0(
    "Y = ",
    round(b0, 4),
    " + ",
    round(b1, 4),
    " * Biaya_Akuisisi_Pelanggan_Juta_IDR",
    " + ",
    round(b2, 4),
    " * Nilai_Pelanggan_Juta_IDR\n"
  )
)

# -----------------------------------------------------------------
# Langkah 4: Interpretasi Koefisien
# -----------------------------------------------------------------
cat("\n========================================\n")
cat("INTERPRETASI KOEFISIEN REGRESI\n")
cat("========================================\n")

cat(
  paste0(
    "Intercept (b0 = ", round(b0, 4), "): ",
    "Jika Biaya Akuisisi Pelanggan dan Nilai Pelanggan bernilai 0, ",
    "maka Pendapatan Tahunan diperkirakan sebesar ",
    round(b0, 4), " miliar IDR.\n\n"
  )
)

cat(
  paste0(
    "Koefisien b1 (", round(b1, 4), "): ",
    "Setiap kenaikan 1 juta IDR Biaya Akuisisi Pelanggan, ",
    "dengan asumsi Nilai Pelanggan konstan, ",
    "akan mengubah Pendapatan Tahunan sebesar ",
    round(b1, 4), " miliar IDR.\n\n"
  )
)

cat(
  paste0(
    "Koefisien b2 (", round(b2, 4), "): ",
    "Setiap kenaikan 1 juta IDR Nilai Pelanggan, ",
    "dengan asumsi Biaya Akuisisi Pelanggan konstan, ",
    "akan meningkatkan Pendapatan Tahunan sebesar ",
    round(b2, 4), " miliar IDR.\n"
  )
)

# -----------------------------------------------------------------
# Langkah 5: Evaluasi Model (R-squared)
# -----------------------------------------------------------------
r_squared <- summary_model$r.squared

cat("\n========================================\n")
cat("EVALUASI MODEL (R-SQUARED)\n")
cat("========================================\n")

cat(
  paste0(
    "Nilai R-squared = ", round(r_squared, 4), "\n"
  )
)

cat(
  paste0(
    "Interpretasi: Sekitar ",
    round(r_squared * 100, 2),
    "% variasi Pendapatan Tahunan ",
    "dapat dijelaskan oleh Biaya Akuisisi Pelanggan ",
    "dan Nilai Pelanggan dalam model regresi ini.\n"
  )
)


avPlots(model_regresi, main = "plot efek parsial")

png(
  filename = "C:/Users/anaka/OneDrive/Desktop/Semester 1/Statistika dan Probabilitas/Tugas_Analisis_Statistik/results/avplot_regresi_tiga_variabel.png",
  width = 900,
  height = 500
)

avPlots(model_regresi, main = "Added Variable Plots (Efek Parsial)")

dev.off()

print("AV Plot berhasil disimpan.")
exists("avPlots")
?avPlots
help(avPlots)
exists("avPlots")

#============SELESAI================
