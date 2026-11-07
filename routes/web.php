
<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\KehadiranController;
use Illuminate\Support\Facades\Route;

// LOGIN
Route::middleware('guest')->group(function () {

    Route::get('/login', [LoginController::class, 'showLogin'])
        ->name('login');

    Route::post('/login', [LoginController::class, 'login'])
        ->middleware('throttle:10,1')
        ->name('login.process');

});

// HALAMAN SETELAH LOGIN
Route::middleware('auth')->group(function () {

    // Dashboard semua pengguna.
    Route::get('/dashboard', [DashboardController::class, 'index'])
        ->name('dashboard');

    Route::get('/', function () {
        return redirect()->route('dashboard');
    });

    // KEHADIRAN MAHASISWA
    Route::middleware('can:mahasiswa')->group(function () {

        Route::post('/kehadiran/{tanggal}', [
            KehadiranController::class,
            'toggle'
        ])
            ->where('tanggal', '\d{4}-\d{2}-\d{2}')
            ->name('kehadiran.toggle');

        Route::delete('/kehadiran/{kehadiran}', [
            KehadiranController::class,
            'destroy'
        ])
            ->name('kehadiran.destroy');

    });

    // KHUSUS ADMINISTRATOR
    Route::middleware('can:admin')->group(function () {

        // Route pengelolaan mahasiswa dan laporan
        // akan ditambahkan ketika modulnya dibuat.

    });

    // LOGOUT
    Route::post('/logout', [LoginController::class, 'logout'])
        ->name('logout');

});
