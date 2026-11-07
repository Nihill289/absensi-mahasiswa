<?php

namespace App\Http\Controllers;

use App\Models\JadwalKuliah;
use App\Models\Kehadiran;
use App\Support\Tanggal;
use Carbon\Carbon;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class KehadiranController extends Controller
{
    /**
     * Centang satu tanggal: semua mata kuliah yang jadwalnya jatuh pada
     * hari itu ikut tercentang. Kalau semuanya sudah tercentang, tanggal
     * ini dibatalkan.
     */
    public function toggle(Request $request, string $tanggal): RedirectResponse
    {
        $tz = config('akademik.timezone');

        if (! Carbon::canBeCreatedFromFormat($tanggal, 'Y-m-d')) {
            abort(404);
        }

        $tgl = Carbon::createFromFormat('Y-m-d', $tanggal, $tz)->startOfDay();

        // Tolak tanggal yang "meluap" (mis. 2026-02-31 jadi 2026-03-03)
        if ($tgl->toDateString() !== $tanggal) {
            abort(404);
        }

        $mulai = Carbon::parse(config('akademik.perkuliahan_mulai'), $tz)->startOfDay();
        $akhir = Carbon::parse(config('akademik.kalender_selesai'), $tz)->startOfDay();
        $hariIni = Carbon::now($tz)->startOfDay();

        if ($tgl->lt($mulai) || $tgl->gt($akhir)) {
            return redirect()->route('dashboard')
                ->with('error', 'Tanggal ini di luar masa perkuliahan.');
        }

        if ($tgl->gt($hariIni)) {
            return redirect()->route('dashboard')
                ->with('error', 'Tanggal ini belum terjadi, jadi belum bisa dicentang.');
        }

        $mataKuliahIds = JadwalKuliah::where('hari', Tanggal::namaHari($tgl))
            ->pluck('mata_kuliah_id')
            ->unique()
            ->values();

        if ($mataKuliahIds->isEmpty()) {
            return redirect()->route('dashboard')
                ->with('error', 'Tidak ada mata kuliah pada hari ' . Tanggal::namaHari($tgl) . '.');
        }

        $mahasiswaId = Auth::id();

        $sudah = Kehadiran::where('mahasiswa_id', $mahasiswaId)
            ->where('tanggal', $tanggal)
            ->whereIn('mata_kuliah_id', $mataKuliahIds)
            ->pluck('mata_kuliah_id');

        $label = Tanggal::pendek($tgl);

        if ($sudah->count() >= $mataKuliahIds->count()) {
            Kehadiran::where('mahasiswa_id', $mahasiswaId)
                ->where('tanggal', $tanggal)
                ->whereIn('mata_kuliah_id', $mataKuliahIds)
                ->delete();

            return redirect()->route('dashboard')
                ->with('success', "Centang tanggal {$label} dibatalkan.");
        }

        foreach ($mataKuliahIds->diff($sudah) as $mataKuliahId) {
            Kehadiran::firstOrCreate([
                'mahasiswa_id' => $mahasiswaId,
                'mata_kuliah_id' => $mataKuliahId,
                'tanggal' => $tanggal,
            ]);
        }

        return redirect()->route('dashboard')
            ->with('success', "Tanggal {$label} dicentang untuk {$mataKuliahIds->count()} mata kuliah.");
    }

    /** Batalkan satu pertemuan pada satu mata kuliah (milik sendiri). */
    public function destroy(Kehadiran $kehadiran): RedirectResponse
    {
        abort_unless((int) $kehadiran->mahasiswa_id === (int) Auth::id(), 403);

        $kehadiran->delete();

        return redirect()->route('dashboard')
            ->with('success', 'Pertemuan dibatalkan.');
    }
}
