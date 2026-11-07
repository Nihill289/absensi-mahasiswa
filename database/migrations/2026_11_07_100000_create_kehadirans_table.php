<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Satu baris = satu mahasiswa sudah mengikuti satu pertemuan
        // sebuah mata kuliah pada satu tanggal. Nomor pertemuan dihitung
        // dari urutan tanggal, jadi tidak disimpan.
        Schema::create('kehadirans', function (Blueprint $table) {
            $table->id();

            $table->foreignId('mahasiswa_id')
                ->constrained('mahasiswas')
                ->cascadeOnDelete();

            $table->foreignId('mata_kuliah_id')
                ->constrained('mata_kuliahs')
                ->cascadeOnDelete();

            $table->date('tanggal');

            $table->timestamps();

            $table->unique(['mahasiswa_id', 'mata_kuliah_id', 'tanggal']);
            $table->index('tanggal');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('kehadirans');
    }
};
