<?php

namespace App\Support;

use Carbon\CarbonInterface;

class Tanggal
{
    private const HARI = [
        1 => 'Senin',
        2 => 'Selasa',
        3 => 'Rabu',
        4 => 'Kamis',
        5 => 'Jumat',
        6 => 'Sabtu',
        7 => 'Minggu',
    ];

    private const BULAN = [
        1 => 'Januari',
        2 => 'Februari',
        3 => 'Maret',
        4 => 'April',
        5 => 'Mei',
        6 => 'Juni',
        7 => 'Juli',
        8 => 'Agustus',
        9 => 'September',
        10 => 'Oktober',
        11 => 'November',
        12 => 'Desember',
    ];

    /** Nama hari dalam bahasa Indonesia (sama dengan nilai enum jadwal_kuliahs.hari). */
    public static function namaHari(CarbonInterface $tanggal): string
    {
        return self::HARI[$tanggal->dayOfWeekIso];
    }

    public static function namaBulan(CarbonInterface $tanggal): string
    {
        return self::BULAN[$tanggal->month];
    }

    /** Contoh: 18 Agu */
    public static function pendek(CarbonInterface $tanggal): string
    {
        return $tanggal->day . ' ' . substr(self::BULAN[$tanggal->month], 0, 3);
    }

    /** Contoh: 18 Agustus 2026 */
    public static function panjang(CarbonInterface $tanggal): string
    {
        return $tanggal->day . ' ' . self::BULAN[$tanggal->month] . ' ' . $tanggal->year;
    }
}
