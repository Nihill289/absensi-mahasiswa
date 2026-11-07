<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class JadwalKuliah extends Model
{
    protected $fillable = [
        'mata_kuliah_id',
        'hari',
        'jam_mulai',
        'jam_selesai',
        'ruangan',
        'timezone',
    ];

    public function mataKuliah(): BelongsTo
    {
        return $this->belongsTo(MataKuliah::class);
    }
}
