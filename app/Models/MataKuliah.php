<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class MataKuliah extends Model
{
    protected $table = 'mata_kuliahs';

    protected $fillable = [
        'kode',
        'nama',
        'sks',
        'dosen',
        'total_pertemuan',
    ];

    public function jadwalKuliahs(): HasMany
    {
        return $this->hasMany(JadwalKuliah::class);
    }

    public function kehadirans(): HasMany
    {
        return $this->hasMany(Kehadiran::class);
    }
}
