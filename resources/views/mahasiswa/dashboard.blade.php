
@extends('layouts.app')

@section('title', 'Dashboard Mahasiswa')
@section('heading', 'Dashboard Mahasiswa')
@section('subtitle', 'Selamat datang di Sistem Absensi TRI')

@section('content')

<section id="ringkasan" class="ringkasan">
    <div class="section-heading">
        <div>
            <h2>Progres Perkuliahan Saya</h2>
            <p class="subjudul">
                Tahun akademik {{ $tahunAkademik }}.
                Perkuliahan dimulai {{ $mulaiLabel }}.
            </p>
        </div>

        <span class="tahun-akademik">{{ $tahunAkademik }}</span>
    </div>

    <div class="kartu-ringkasan">
        <div class="kartu">
            <span class="kartu-angka">{{ $statistik['ringkasan']['total'] }}</span>
            <span class="kartu-label">Total Mata Kuliah</span>
        </div>

        <div class="kartu kartu-selesai">
            <span class="kartu-angka">{{ $statistik['ringkasan']['selesai'] }}</span>
            <span class="kartu-label">Selesai 100%</span>
        </div>

        <div class="kartu kartu-berjalan">
            <span class="kartu-angka">{{ $statistik['ringkasan']['berjalan'] }}</span>
            <span class="kartu-label">Sedang Berjalan</span>
        </div>

        <div class="kartu kartu-rendah">
            <span class="kartu-angka">{{ $statistik['ringkasan']['rendah'] }}</span>
            <span class="kartu-label">Perlu Perhatian</span>
        </div>
    </div>
</section>

<section id="kalender" class="kalender">
    <div class="section-heading">
        <div>
            <h2>Kalender Kehadiran</h2>
            <p class="petunjuk">
                Centang tanggal perkuliahan untuk memperbarui kehadiran Anda.
            </p>
        </div>
        <div class="section-icon">📅</div>
    </div>

    <ul class="legenda">
        <li><span class="penanda penanda-penuh"></span> Semua tercentang</li>
        <li><span class="penanda penanda-sebagian"></span> Sebagian tercentang</li>
        <li><span class="penanda penanda-kosong"></span> Belum tercentang</li>
        <li><span class="penanda penanda-libur"></span> Tidak ada kuliah</li>
    </ul>

    <div class="daftar-bulan">
        @foreach ($bulan as $b)
            <div class="bulan" id="bulan-{{ $b['key'] }}">
                <h3>{{ $b['nama'] }}</h3>

                <table class="grid-kalender">
                    <thead>
                        <tr>
                            @foreach (['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'] as $nama)
                                <th>{{ $nama }}</th>
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
                                        <td class="sel sel-{{ $h['status'] }} {{ $h['hari_ini'] ? 'sel-hari-ini' : '' }}">
                                            @if ($h['bisa'])
                                                <form method="POST"
                                                    action="{{ route('kehadiran.toggle', $h['tanggal']) }}"
                                                    data-simpan-scroll>
                                                    @csrf

                                                    <label title="{{ $h['daftar'] }}">
                                                        <input type="checkbox"
                                                            @checked($h['status'] === 'penuh')
                                                            @if ($h['status'] === 'sebagian') data-sebagian @endif
                                                            onchange="this.form.requestSubmit()">

                                                        <span class="angka">{{ $h['angka'] }}</span>
                                                        <small class="hitung">
                                                            {{ $h['dicentang'] }}/{{ $h['jumlah'] }}
                                                        </small>
                                                    </label>
                                                </form>
                                            @else
                                                <span class="angka">{{ $h['angka'] }}</span>
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

<section id="statistik" class="statistik">
    <div class="section-heading">
        <div>
            <h2>Statistik Mata Kuliah Saya</h2>
            <p class="petunjuk">
                Pantau perkembangan kehadiran setiap mata kuliah.
            </p>
        </div>
        <div class="section-icon">📊</div>
    </div>

    <div class="daftar-statistik">
        @forelse ($statistik['daftar'] as $s)
            <article class="matkul matkul-{{ $s['level'] }}">
                <div class="matkul-kepala">
                    <div>
                        <h3>{{ $s['mk']->kode }} - {{ $s['mk']->nama }}</h3>
                        <p class="meta">
                            {{ $s['mk']->dosen }}
                            @if ($s['jadwal'] !== '')
                                · {{ $s['jadwal'] }}
                            @endif
                        </p>
                    </div>

                    <span class="lencana lencana-{{ $s['level'] }}">
                        {{ $s['label'] }}
                    </span>
                </div>

                <div class="progres"
                    role="progressbar"
                    aria-valuenow="{{ $s['persen'] }}"
                    aria-valuemin="0"
                    aria-valuemax="100">
                    <div class="progres-isi"
                        style="width: {{ $s['persen'] }}%">
                    </div>
                </div>

                <p class="angka-progres">
                    {{ $s['selesai'] }} dari {{ $s['total'] }}
                    pertemuan ({{ $s['persen'] }}%)
                </p>

                @if (count($s['pertemuan']) > 0)
                    <div class="pertemuan-container">
                        <span class="pertemuan-label">
                            Pertemuan yang sudah dicentang
                        </span>

                        <ul class="daftar-pertemuan">
                            @foreach ($s['pertemuan'] as $p)
                                <li>
                                    <form method="POST"
                                        action="{{ route('kehadiran.destroy', $p['id']) }}"
                                        data-simpan-scroll>
                                        @csrf
                                        @method('DELETE')

                                        <button type="submit"
                                            title="Batalkan pertemuan {{ $p['ke'] }}">
                                            P{{ $p['ke'] }} · {{ $p['label'] }} ×
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

@endsection
