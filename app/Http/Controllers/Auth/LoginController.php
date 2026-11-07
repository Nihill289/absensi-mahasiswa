<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function showLogin()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $credentials = $request->validate([
            'nim' => ['required', 'string'],
            'password' => ['required', 'string'],
        ]);

        $credentials['status'] = 'aktif';

        if (Auth::attempt($credentials)) {

            $request->session()->regenerate();

            if (Auth::user()->isAdmin()) {
                return redirect()->route('dashboard')
                    ->with('success', 'Selamat datang Administrator!');
            }

            return redirect()->route('dashboard')
                ->with('success', 'Login berhasil!');
        }

        return back()
            ->withErrors([
                'nim' => 'NIM atau password salah, atau akun tidak aktif.',
            ])
            ->onlyInput('nim');
    }

    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('login');
    }
}