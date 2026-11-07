<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class MahasiswaSeeder extends Seeder
{
    public function run(): void
    {
        $mahasiswa = [
            ['2511001', 'ADRIAN SUDIRMAN'],
            ['2511002', 'ALFIN MAHMUD'],
            ['2511003', 'ANDY RICANDI MAKASAR'],
            ['2511006', 'APRILIA PHILADELPIA'],
            ['2511007', 'APTORO NIRIGI'],
            ['2511008', 'BERNARDUS KABRAHANUBUN'],
            ['2511010', 'CELSI O. OHOIULUN'],
            ['2511011', 'DAMIANUS KUDIAI'],
            ['2511012', 'FEBRIANTO SIPAHELUT'],
            ['2511013', 'JELITON ALOM'],
            ['2511014', 'JHELANSY SNAE'],
            ['2511015', 'JULIO JHOSUWA SADSUITUBUN'],
            ['2511017', 'LIONEL. N. E. RAHANGMETAN'],
            ['2511018', 'LOINA MAATOKE'],
            ['2511019', 'MARIA A. JANWARIN'],
            ['2511020', 'MARIA BEATRIX CATERINA RESAM'],
            ['2511021', 'MARIA LODOWINA RUMSORY'],
            ['2511022', 'MARIO JULIAR AGUSTINO LASOL'],
            ['2511023', 'MUH. ABIM PANGESTU'],
            ['2511024', 'MUHAMMAD IRIANTO'],
            ['2511025', 'MUHAMMAD SYAHRIL'],
            ['2511026', 'MUHAMMAD TAUFIQ ILHAM'],
            ['2511027', 'MUHAMMAD YUSUF'],
            ['2511028', 'MULIA HAMDAN BAKTI'],
            ['2511029', 'NAJWA ALICIA PINKAN ZAHRA'],
            ['2511030', 'NURUL RATNA ANDAYANI'],
            ['2511031', 'PRISKILA HAGABAL'],
            ['2511032', 'RAHMAT HIDAYATULLAH'],
            ['2511033', 'RINCE JARINAP'],
            ['2511034', 'SURIANTI ALIAS'],
            ['2511035', "TIKAYANTI RO'SON"],
            ['2511036', 'THERESIA INQE NDVENA'],
            ['2511037', 'YULI MINCE DEGEI'],
            ['2511038', 'YULINCE MAGAI'],
            ['2511039', 'YUSTINA FAUWAWAN'],
        ];

        foreach ($mahasiswa as [$nim, $nama]) {

            User::firstOrCreate(
                ['nim' => $nim],
                [
                    'name' => $nama,
                    'email' => $nim . '@mahasiswa.tri.local',
                    'password' => 'mahasiswa123',
                    'role' => 'mahasiswa',
                    'status' => 'aktif',
                ]
            );
        }

        $this->command->info('35 akun mahasiswa berhasil diperiksa/dibuat.');
    }
}
