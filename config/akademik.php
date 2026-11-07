<?php

return [

    'tahun_akademik' => '2026/2027',

    // Zona waktu Timika / Papua (WIT)
    'timezone' => 'Asia/Jayapura',

    // Rentang bulan yang ditampilkan di kalender (Agustus - November)
    'kalender_mulai' => '2026-08-01',
    'kalender_selesai' => '2026-11-30',

    // Tanggal perkuliahan dimulai. Tanggal sebelum ini tidak bisa dicentang.
    'perkuliahan_mulai' => '2026-08-18',

    // Target pertemuan per mata kuliah (= 100%). Kalender 18 Agu - 30 Nov hanya
    // memuat maksimal 15 tanggal per hari, jadi target harus 15 atau kurang.
    // Bisa diubah per mata kuliah
    // lewat kolom total_pertemuan di tabel mata_kuliahs.
    'total_pertemuan' => 14,

    // NIM yang berperan sebagai administrator
    'admin_nim' => '2511009',

];
