
@extends('layouts.app')

@section('title', 'Dashboard')
@section('heading', 'Dashboard Absensi')
@section('subtitle', 'Tahun Akademik ' . $tahunAkademik . ' · Politeknik Amamapare')

@section('content')

{{-- ==========================================
     RINGKASAN PROGRES PERKULIAHAN
========================================== --}}

<section id="ringkasan" class="ringkasan">

    <div class="section-heading">
        <div>
            <h2>Progres Perkuliahan</h2>
            <p class="subjudul">
                Perkuliahan dimulai {{ $mulaiLabel }}.
            </p>
        </div>
        <span class="tahun-akademik">{{ $tahunAkademik }}</span>
    </div>

    <div class="kartu-ringkasan">

        <div class="kartu">
            <div class="kartu-top">
                <div class="kartu-icon icon-biru">📚</div>
                <span class="kartu-status">Akademik</span>
            </div>
            <span class="kartu-angka">
                {{ $statistik['ringkasan']['total'] }}
            </span>
            <span class="kartu-label">Total Mata Kuliah</span>
        </div>

        <div class="kartu kartu-selesai">
            <div class="kartu-top">
                <div class="kartu-icon icon-hijau">✓</div>
                <span class="kartu-status">Selesai</span>
            </div>
            <span class="kartu-angka">
                {{ $statistik['ringkasan']['selesai'] }}
            </span>
            <span class="kartu-label">Mata Kuliah Selesai 100%</span>
        </div>

        <div class="kartu kartu-berjalan">
            <div class="kartu-top">
                <div class="kartu-icon icon-kuning">◷</div>
                <span class="kartu-status">Berjalan</span>
            </div>
            <span class="kartu-angka">
                {{ $statistik['ringkasan']['berjalan'] }}
            </span>
            <span class="kartu-label">Progres 60% atau Lebih</span>
        </div>

        <div class="kartu kartu-rendah">
            <div class="kartu-top">
                <div class="kartu-icon icon-merah">!</div>
                <span class="kartu-status">Perhatian</span>
            </div>
            <span class="kartu-angka">
                {{ $statistik['ringkasan']['rendah'] }}
            </span>
            <span class="kartu-label">Progres di Bawah 60%</span>
        </div>

    </div>

</section>


{{-- ==========================================
     KALENDER AKADEMIK
========================================== --}}

<section id="kalender" class="kalender">

    <div class="section-heading">
        <div>
            <h2>Kalender Akademik</h2>
            <p class="petunjuk">
                Centang tanggal pertemuan untuk memperbarui
                kehadiran seluruh mata kuliah pada hari tersebut.
            </p>
        </div>

        <div class="section-icon">📅</div>
    </div>

    {{-- LEGENDA --}}

    <ul class="legenda">
        <li>
            <span class="penanda penanda-penuh"></span>
            Semua tercentang
        </li>

        <li>
            <span class="penanda penanda-sebagian"></span>
            Sebagian tercentang
        </li>

        <li>
            <span class="penanda penanda-kosong"></span>
            Belum dicentang
        </li>

        <li>
            <span class="penanda penanda-libur"></span>
            Tidak ada kuliah
        </li>
    </ul>

    {{-- DAFTAR BULAN --}}

    <div class="daftar-bulan">

        @foreach ($bulan as $b)

            <div class="bulan" id="bulan-{{ $b['key'] }}">

                <h3>{{ $b['nama'] }}</h3>

                <table class="grid-kalender">

                    <thead>
                        <tr>
                            @foreach (['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'] as $nama)
                                <th scope="col">{{ $nama }}</th>
                            @endforeach
                        </tr>
                    </thead>

                    <tbody>

                        @foreach ($b['minggu'] as $minggu)

                            <tr>

                                @foreach ($minggu as $h)

                                    @if ($h === null)

                                        <td class="sel sel-kosong-grid"></td>

                                    @else

                                        <td class="
                                            sel
                                            sel-{{ $h['status'] }}
                                            {{ $h['hari_ini'] ? 'sel-hari-ini' : '' }}
                                        ">

                                            @if ($h['bisa'])

                                                <form
                                                    method="POST"
                                                    action="{{ route('kehadiran.toggle', $h['tanggal']) }}"
                                                    data-simpan-scroll
                                                >

                                                    @csrf

                                                    <label title="{{ $h['daftar'] }}">

                                                        <input
                                                            type="checkbox"
                                                            aria-label="Pertemuan tanggal {{ $h['tanggal'] }}"
                                                            @checked($h['status'] === 'penuh')
                                                            @if ($h['status'] === 'sebagian')
                                                                data-sebagian
                                                            @endif
                                                            onchange="this.form.requestSubmit()"
                                                        >

                                                        <span class="angka">
                                                            {{ $h['angka'] }}
                                                        </span>

                                                        <small class="hitung">
                                                            {{ $h['dicentang'] }}/{{ $h['jumlah'] }}
                                                        </small>

                                                    </label>

                                                    <noscript>
                                                        <button type="submit">
                                                            Simpan
                                                        </button>
                                                    </noscript>

                                                </form>

                                            @else

                                                <span
                                                    class="angka"
                                                    @if ($h['daftar'] !== '')
                                                        title="{{ $h['daftar'] }}"
                                                    @endif
                                                >
                                                    {{ $h['angka'] }}
                                                </span>

                                            @endif

                                        </td>

                                    @endif

                                @endforeach

                            </tr>

                        @endforeach

                    </tbody>

                </table>

            </div>

        @endforeach

    </div>

</section>


{{-- ==========================================
     STATISTIK MATA KULIAH
========================================== --}}

<section id="statistik" class="statistik">

    <div class="section-heading">

        <div>
            <h2>Statistik Mata Kuliah</h2>
            <p class="petunjuk">
                Mata kuliah dengan progres paling rendah
                ditampilkan terlebih dahulu.
            </p>
        </div>

        <div class="section-icon">📊</div>

    </div>

    <div class="daftar-statistik">

        @forelse ($statistik['daftar'] as $s)

            <article class="matkul matkul-{{ $s['level'] }}">

                <div class="matkul-kepala">

                    <div class="matkul-identitas">

                        <h3>
                            {{ $s['mk']->kode }} -
                            {{ $s['mk']->nama }}
                        </h3>

                        <p class="meta">
                            {{ $s['mk']->dosen }}

                            @if ($s['jadwal'] !== '')
                                &middot; {{ $s['jadwal'] }}
                            @endif
                        </p>

                    </div>

                    <span class="lencana lencana-{{ $s['level'] }}">
                        {{ $s['label'] }}
                    </span>

                </div>

                {{-- PROGRESS BAR --}}

                <div class="progress-container">

                    <div
                        class="progres"
                        role="progressbar"
                        aria-valuenow="{{ $s['persen'] }}"
                        aria-valuemin="0"
                        aria-valuemax="100"
                        aria-label="Progres {{ $s['mk']->nama }}"
                    >

                        <div
                            class="progres-isi"
                            style="width: {{ $s['persen'] }}%"
                        ></div>

                    </div>

                    <div class="progress-detail">

                        <span>
                            {{ $s['selesai'] }} dari {{ $s['total'] }}
                            pertemuan
                        </span>

                        <strong>{{ $s['persen'] }}%</strong>

                    </div>

                </div>

                {{-- DAFTAR PERTEMUAN --}}

                @if (count($s['pertemuan']) > 0)

                    <div class="pertemuan-container">

                        <span class="pertemuan-label">
                            Pertemuan yang sudah dicentang
                        </span>

                        <ul class="daftar-pertemuan">

                            @foreach ($s['pertemuan'] as $p)

                                <li>

                                    <form
                                        method="POST"
                                        action="{{ route('kehadiran.destroy', $p['id']) }}"
                                        data-simpan-scroll
                                    >

                                        @csrf
                                        @method('DELETE')

                                        <button
                                            type="submit"
                                            title="Batalkan pertemuan {{ $p['ke'] }}"
                                        >
                                            P{{ $p['ke'] }}
                                            · {{ $p['label'] }}
                                            ×
                                        </button>

                                    </form>

                                </li>

                            @endforeach

                        </ul>

                    </div>

                @endif

            </article>

        @empty

            <div class="empty-state">
                <div>📚</div>
                <h3>Belum Ada Mata Kuliah</h3>
                <p>Data mata kuliah belum tersedia.</p>
            </div>

        @endforelse

    </div>

</section>


{{-- ==========================================
     RINGKASAN ADMINISTRATOR
========================================== --}}

@if ($admin)

    <section id="admin" class="admin">

        <div class="section-heading">

            <div>
                <h2>Ringkasan Seluruh Mahasiswa</h2>

                <p class="petunjuk">
                    Terdapat
                    <strong>{{ $admin['jumlah_mahasiswa'] }}</strong>
                    mahasiswa aktif.
                </p>
            </div>

            <div class="section-icon">👨‍🎓</div>

        </div>


        {{-- RATA-RATA MATA KULIAH --}}

        <div class="admin-subsection">

            <h3>Rata-rata Progres per Mata Kuliah</h3>

            <div class="table-wrapper">

                <table class="tabel">

                    <thead>
                        <tr>
                            <th scope="col">Mata Kuliah</th>
                            <th scope="col">Rata-rata Progres</th>
                        </tr>
                    </thead>

                    <tbody>

                        @foreach ($admin['per_mata_kuliah'] as $r)

                            <tr>

                                <td>
                                    <strong>{{ $r['kode'] }}</strong>
                                    - {{ $r['nama'] }}
                                </td>

                                <td>
                                    <span class="persen-admin">
                                        {{ $r['persen'] }}%
                                    </span>
                                </td>

                            </tr>

                        @endforeach

                    </tbody>

                </table>

            </div>

        </div>


        {{-- PROGRES MAHASISWA --}}

        <div class="admin-subsection">

            <h3>Progres per Mahasiswa</h3>

            <div class="table-wrapper">

                <table class="tabel">

                    <thead>
                        <tr>
                            <th scope="col">NIM</th>
                            <th scope="col">Nama Mahasiswa</th>
                            <th scope="col">Pertemuan Tercentang</th>
                            <th scope="col">Progres Keseluruhan</th>
                        </tr>
                    </thead>

                    <tbody>

                        @foreach ($admin['per_mahasiswa'] as $r)

                            <tr>

                                <td>{{ $r['nim'] }}</td>

                                <td>
                                    <strong>{{ $r['nama'] }}</strong>
                                </td>

                                <td>{{ $r['selesai'] }}</td>

                                <td>
                                    <span class="persen-admin">
                                        {{ $r['persen'] }}%
                                    </span>
                                </td>

                            </tr>

                        @endforeach

                    </tbody>

                </table>

            </div>

        </div>

    </section>

@endif

@endsection
