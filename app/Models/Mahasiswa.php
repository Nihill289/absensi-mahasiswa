<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Mahasiswa extends Authenticatable
{
    protected $table = 'mahasiswas';

    protected $fillable = [
        'nim',
        'nama',
        'password',
        'jenis_kelamin',
        'semester',
        'status',
    ];

    protected $hidden = [
        'password',
    ];

    protected function casts(): array
    {
        return [
            'password' => 'hashed',
        ];
    }

    // Tabel mahasiswas tidak punya kolom remember_token.
    public function getRememberTokenName(): string
    {
        return '';
    }

    public function kehadirans(): HasMany
    {
        return $this->hasMany(Kehadiran::class);
    }

    public function isAdmin(): bool
    {
        return $this->nim === config('akademik.admin_nim');
    }
}
