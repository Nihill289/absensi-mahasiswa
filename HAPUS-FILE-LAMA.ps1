# Jalankan dari folder proyek: C:\laragon\www\absensi-mhs
# (klik kanan folder > Open in Terminal, lalu: .\HAPUS-FILE-LAMA.ps1)
$hapus = @(
  "app\Models\Absensi.php",
  "app\Models\Pertemuan.php",
  "app\Http\Controllers\MahasiswaController.php",
  "resources\views\layouts\sidebar.blade.php",
  "resources\views\dashboard\index.blade.php",
  "resources\views\dashboard\mahasiswa.blade.php",
  "resources\views\mahasiswa",
  "database\migrations\2026_11_06_181549_create_pertemuans_table.php",
  "database\migrations\2026_11_06_181848_create_absensis_table.php",
  "database\migrations\2026_11_06_202133_add_columns_to_jadwal_kuliahs_table.php",
  "database\migrations\2026_11_06_204031_add_unique_constraint_to_absensis_table.php"
)
foreach ($p in $hapus) {
  if (Test-Path $p) { Remove-Item $p -Recurse -Force; Write-Host "dihapus: $p" }
  else { Write-Host "sudah tidak ada: $p" }
}
