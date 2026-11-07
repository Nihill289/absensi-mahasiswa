<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Kehadiran extends Model
{
    protected $table = 'kehadirans';

    protected $fillable = [
        'mahasiswa_id',
        'mata_kuliah_id',
        'tanggal',
    ];

    // Kolom `tanggal` sengaja tidak di-cast: nilainya selalu string 'Y-m-d'
    // sehingga konsisten di MySQL maupun SQLite.

    public function mahasiswa(): BelongsTo
    {
        return $this->belongsTo(Mahasiswa::class);
    }

    public function mataKuliah(): BelongsTo
    {
        return $this->belongsTo(MataKuliah::class);
    }
}
