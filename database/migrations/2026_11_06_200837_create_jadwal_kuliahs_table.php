<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('jadwal_kuliahs', function (Blueprint $table) {
            $table->id();

            $table->foreignId('mata_kuliah_id')
                ->constrained('mata_kuliahs')
                ->cascadeOnDelete();

            $table->enum('hari', [
                'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu',
            ]);

            $table->time('jam_mulai');
            $table->time('jam_selesai');
            $table->string('ruangan', 100)->nullable();
            $table->string('timezone', 50)->default('Asia/Jayapura');

            $table->timestamps();

            // Satu mata kuliah hanya punya satu jadwal per hari
            $table->unique(['mata_kuliah_id', 'hari']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('jadwal_kuliahs');
    }
};
