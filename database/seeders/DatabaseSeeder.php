<?php

namespace Database\Seeders;

use App\Models\JadwalKuliah;
use App\Models\Mahasiswa;
use App\Models\MataKuliah;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->seedMahasiswa();
        $this->seedMataKuliah();
    }

    private function seedMahasiswa(): void
    {
        // [nim, nama, password]
        // 2511009 adalah administrator (lihat config/akademik.php).
        // CONTOH: ganti nama dan tambahkan mahasiswa yang sebenarnya di sini.
        $daftar = [
            ['2511009', 'Administrator', 'root'],
            ['2511001', 'Mahasiswa Contoh 1', 'mahasiswa123'],
            ['2511002', 'Mahasiswa Contoh 2', 'mahasiswa123'],
            ['2511003', 'Mahasiswa Contoh 3', 'mahasiswa123'],
        ];

        foreach ($daftar as [$nim, $nama, $password]) {
            Mahasiswa::updateOrCreate(
                ['nim' => $nim],
                [
                    'nama' => $nama,
                    'password' => $password, // di-hash otomatis oleh model
                    'semester' => 3,
                    'status' => 'aktif',
                ]
            );
        }
    }

    private function seedMataKuliah(): void
    {
        // CONTOH: ganti dengan mata kuliah dan jadwal yang sebenarnya.
        // jadwal: [hari, jam_mulai, jam_selesai, ruangan]
        // Satu mata kuliah cukup satu jadwal per hari. Hari yang tidak
        // punya jadwal (mis. Jumat) otomatis tidak bisa dicentang.
        $daftar = [
            ['TRI301', 'Pemrograman Web', 3, 'Dosen Pengampu', ['Senin', '08:00', '10:30', 'Lab 1']],
            ['TRI302', 'Basis Data', 3, 'Dosen Pengampu', ['Senin', '10:30', '13:00', 'Lab 1']],
            ['TRI303', 'Jaringan Komputer', 3, 'Dosen Pengampu', ['Selasa', '08:00', '10:30', 'Lab 2']],
            ['TRI304', 'Sistem Operasi', 3, 'Dosen Pengampu', ['Rabu', '08:00', '10:30', 'Lab 2']],
            ['TRI305', 'Bahasa Inggris Teknik', 2, 'Dosen Pengampu', ['Rabu', '13:00', '14:40', 'R. 201']],
            ['TRI306', 'Statistika', 2, 'Dosen Pengampu', ['Kamis', '08:00', '09:40', 'R. 201']],
        ];

        foreach ($daftar as [$kode, $nama, $sks, $dosen, $jadwal]) {
            $mk = MataKuliah::updateOrCreate(
                ['kode' => $kode],
                [
                    'nama' => $nama,
                    'sks' => $sks,
                    'dosen' => $dosen,
                    'total_pertemuan' => config('akademik.total_pertemuan'),
                ]
            );

            [$hari, $mulai, $selesai, $ruangan] = $jadwal;

            JadwalKuliah::updateOrCreate(
                ['mata_kuliah_id' => $mk->id, 'hari' => $hari],
                ['jam_mulai' => $mulai, 'jam_selesai' => $selesai, 'ruangan' => $ruangan]
            );
        }
    }
}
