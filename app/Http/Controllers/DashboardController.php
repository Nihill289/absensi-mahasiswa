<?php

namespace App\Http\Controllers;

use App\Models\Kehadiran;
use App\Models\Mahasiswa;
use App\Models\MataKuliah;
use App\Support\Tanggal;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        $isAdmin = $user->isAdmin();

        $tz = config('akademik.timezone');

        $hariIni = Carbon::now($tz)->startOfDay();

        $mulaiKuliah = Carbon::parse(
            config('akademik.perkuliahan_mulai'), $tz
        )->startOfDay();

        $kalenderMulai = Carbon::parse(
            config('akademik.kalender_mulai'), $tz
        )->startOfMonth();

        $kalenderSelesai = Carbon::parse(
            config('akademik.kalender_selesai'), $tz
        )->startOfDay();

        // Mengambil seluruh mata kuliah beserta jadwalnya.
        $mataKuliahs = MataKuliah::with('jadwalKuliahs')
            ->orderBy('kode')
            ->get();

        // Mengelompokkan mata kuliah berdasarkan hari.
        $mkPerHari = [];

        foreach ($mataKuliahs as $mk) {
            foreach ($mk->jadwalKuliahs as $jadwal) {
                $mkPerHari[$jadwal->hari][] = $mk;
            }
        }

        // Mengambil kehadiran milik pengguna yang sedang login.
        $kehadirans = Kehadiran::where('mahasiswa_id', $user->id)
            ->orderBy('tanggal')
            ->get();

        $perMataKuliah = $kehadirans->groupBy('mata_kuliah_id');
        $perTanggal = $kehadirans->groupBy('tanggal');

        // Data dashboard utama.
        $data = [
            'tahunAkademik' => config('akademik.tahun_akademik'),

            'mulaiLabel' => Tanggal::panjang($mulaiKuliah),

            'bulan' => $this->susunKalender(
                $kalenderMulai,
                $kalenderSelesai,
                $mulaiKuliah,
                $hariIni,
                $mkPerHari,
                $perTanggal
            ),

            'statistik' => $this->hitungStatistik(
                $mataKuliahs,
                $perMataKuliah
            ),

            'admin' => null,
        ];

        // Data tambahan hanya untuk administrator.
        if ($isAdmin) {
            $data['admin'] = $this->dataAdmin($mataKuliahs);
        }

        return view('dashboard', $data);
    }

    private function susunKalender(
        Carbon $mulai,
        Carbon $selesai,
        Carbon $mulaiKuliah,
        Carbon $hariIni,
        array $mkPerHari,
        $perTanggal
    ): array {
        $bulan = [];
        $kursor = $mulai->copy();

        while ($kursor->lte($selesai)) {
            $awal = $kursor->copy()->startOfMonth();
            $akhir = $kursor->copy()->endOfMonth()->startOfDay();

            $minggu = [];

            $baris = array_fill(
                0,
                $awal->dayOfWeekIso - 1,
                null
            );

            for ($d = $awal->copy(); $d->lte($akhir); $d->addDay()) {

                $baris[] = $this->susunSel(
                    $d,
                    $mulaiKuliah,
                    $hariIni,
                    $mkPerHari,
                    $perTanggal
                );

                if (count($baris) === 7) {
                    $minggu[] = $baris;
                    $baris = [];
                }
            }

            if ($baris !== []) {
                $minggu[] = array_pad($baris, 7, null);
            }

            $bulan[] = [
                'key' => $awal->format('Y-m'),
                'nama' => Tanggal::namaBulan($awal) . ' ' . $awal->year,
                'minggu' => $minggu,
            ];

            $kursor = $awal->addMonthNoOverflow();
        }

        return $bulan;
    }

    private function susunSel(
        Carbon $d,
        Carbon $mulaiKuliah,
        Carbon $hariIni,
        array $mkPerHari,
        $perTanggal
    ): array {
        $daftar = $mkPerHari[Tanggal::namaHari($d)] ?? [];

        $ids = array_map(fn ($mk) => $mk->id, $daftar);

        $jumlah = count($ids);
        $key = $d->toDateString();

        $dicentang = isset($perTanggal[$key])
            ? $perTanggal[$key]->whereIn('mata_kuliah_id', $ids)->count()
            : 0;

        if ($d->lt($mulaiKuliah)) {
            $status = 'di-luar';
        } elseif ($jumlah === 0) {
            $status = 'libur';
        } elseif ($d->gt($hariIni)) {
            $status = 'akan-datang';
        } elseif ($dicentang >= $jumlah) {
            $status = 'penuh';
        } elseif ($dicentang > 0) {
            $status = 'sebagian';
        } else {
            $status = 'kosong';
        }

        return [
            'tanggal' => $key,
            'angka' => $d->day,
            'status' => $status,
            'bisa' => in_array(
                $status,
                ['penuh', 'sebagian', 'kosong'],
                true
            ),
            'jumlah' => $jumlah,
            'dicentang' => $dicentang,
            'hari_ini' => $d->equalTo($hariIni),
            'daftar' => implode(
                ', ',
                array_map(fn ($mk) => $mk->nama, $daftar)
            ),
        ];
    }

    private function hitungStatistik(
        $mataKuliahs,
        $perMataKuliah
    ): array {
        $daftar = $mataKuliahs->map(function ($mk) use ($perMataKuliah) {

            $baris = $perMataKuliah
                ->get($mk->id, collect())
                ->values();

            $selesai = $baris->count();

            $total = max(1, (int) $mk->total_pertemuan);

            $persen = $selesai >= $total
                ? 100
                : (int) floor($selesai / $total * 100);

            if ($selesai >= $total) {
                $level = 'selesai';
                $label = 'Selesai 100%';
            } elseif ($selesai * 100 >= $total * 60) {
                $level = 'berjalan';
                $label = '60% atau lebih';
            } else {
                $level = 'rendah';
                $label = 'Di bawah 60%';
            }

            return [
                'mk' => $mk,
                'selesai' => $selesai,
                'total' => $total,
                'persen' => $persen,
                'level' => $level,
                'label' => $label,

                'jadwal' => $mk->jadwalKuliahs
                    ->map(fn ($j) =>
                        $j->hari . ' ' .
                        substr($j->jam_mulai, 0, 5) . '-' .
                        substr($j->jam_selesai, 0, 5)
                    )
                    ->implode(', '),

                'pertemuan' => $baris->map(fn ($k, $i) => [
                    'id' => $k->id,
                    'ke' => $i + 1,
                    'label' => Tanggal::pendek(
                        Carbon::parse($k->tanggal)
                    ),
                ])->all(),
            ];
        })->sortBy('persen')->values();

        return [
            'daftar' => $daftar->all(),

            'ringkasan' => [
                'total' => $daftar->count(),

                'selesai' => $daftar
                    ->where('level', 'selesai')
                    ->count(),

                'berjalan' => $daftar
                    ->where('level', 'berjalan')
                    ->count(),

                'rendah' => $daftar
                    ->where('level', 'rendah')
                    ->count(),
            ],
        ];
    }

    private function dataAdmin($mataKuliahs): array
    {
        $peserta = Mahasiswa::where('status', 'aktif')
            ->orderBy('nim')
            ->withCount('kehadirans')
            ->get();

        $jumlahPeserta = max(1, $peserta->count());

        $targetPerMahasiswa = max(
            1,
            (int) $mataKuliahs->sum('total_pertemuan')
        );

        $perMahasiswa = $peserta->map(fn ($m) => [
            'nim' => $m->nim,
            'nama' => $m->nama,
            'selesai' => $m->kehadirans_count,

            'persen' => min(
                100,
                (int) floor(
                    $m->kehadirans_count /
                    $targetPerMahasiswa * 100
                )
            ),
        ])->all();

        $totalPerMk = Kehadiran::whereIn(
            'mahasiswa_id',
            $peserta->pluck('id')
        )
            ->selectRaw('mata_kuliah_id, count(*) as n')
            ->groupBy('mata_kuliah_id')
            ->pluck('n', 'mata_kuliah_id');

        $perMataKuliah = $mataKuliahs->map(
            function ($mk) use ($totalPerMk, $jumlahPeserta) {

                $target = $jumlahPeserta *
                    max(1, (int) $mk->total_pertemuan);

                return [
                    'kode' => $mk->kode,
                    'nama' => $mk->nama,

                    'persen' => min(
                        100,
                        (int) floor(
                            ($totalPerMk[$mk->id] ?? 0) /
                            $target * 100
                        )
                    ),
                ];
            }
        )->all();

        return [
            'jumlah_mahasiswa' => $peserta->count(),
            'per_mahasiswa' => $perMahasiswa,
            'per_mata_kuliah' => $perMataKuliah,
        ];
    }
}
