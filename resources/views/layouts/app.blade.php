<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>@yield('title', 'Dashboard') - Absensi TRI</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="{{ asset('css/dashboard.css') }}">
    <link rel="stylesheet" href="{{ asset('css/sidebar.css') }}">
    <link rel="stylesheet" href="{{ asset('css/calendar.css') }}">
    <link rel="stylesheet" href="{{ asset('css/responsive.css') }}">

    @stack('styles')
</head>

<body>

@php
    $pengguna = auth()->user();
    $adminAktif = $pengguna->isAdmin();
@endphp

<div class="app-layout">

    {{-- SIDEBAR --}}
    <aside class="sidebar">

        <div class="sidebar-brand">
            <div class="sidebar-logo">TRI</div>

            <div>
                <h3>POLITEKNIK</h3>
                <span>AMAMAPARE</span>
            </div>
        </div>

        {{-- MENU UTAMA --}}
        <div class="sidebar-section">

            <div class="sidebar-label">MENU UTAMA</div>

            <ul class="sidebar-menu">

                <li>
                    <a href="{{ route('dashboard') }}"
                       class="{{ request()->routeIs('dashboard') ? 'active' : '' }}">
                        <span class="sidebar-icon">▦</span>
                        <span>Dashboard</span>
                    </a>
                </li>

                <li>
                    <a href="{{ route('dashboard') }}#kalender">
                        <span class="sidebar-icon">▣</span>
                        <span>Kalender Akademik</span>
                    </a>
                </li>

                @if ($adminAktif)

                    <li>
                        <a href="{{ route('dashboard') }}#admin">
                            <span class="sidebar-icon">▤</span>
                            <span>Data Mahasiswa</span>
                        </a>
                    </li>

                    <li>
                        <a href="{{ route('dashboard') }}#statistik">
                            <span class="sidebar-icon">▥</span>
                            <span>Statistik Akademik</span>
                        </a>
                    </li>

                @else

                    <li>
                        <a href="{{ route('dashboard') }}#statistik">
                            <span class="sidebar-icon">▤</span>
                            <span>Progres Mata Kuliah</span>
                        </a>
                    </li>

                @endif

            </ul>

        </div>

        {{-- MENU LAPORAN KHUSUS ADMIN --}}
        @if ($adminAktif)

            <div class="sidebar-section">

                <div class="sidebar-label">LAPORAN</div>

                <ul class="sidebar-menu">

                    <li>
                        <a href="{{ route('dashboard') }}#admin">
                            <span class="sidebar-icon">▧</span>
                            <span>Rekap Absensi</span>
                        </a>
                    </li>

                </ul>

            </div>

        @endif

        {{-- INFORMASI PENGGUNA --}}
        <div class="sidebar-bottom">

            <div class="sidebar-user">
                <div class="user-avatar">
                    {{ strtoupper(substr($pengguna->nama, 0, 1)) }}
                </div>

                <div class="user-info">
                    <h4>{{ $pengguna->nama }}</h4>
                    <span>{{ $adminAktif ? 'Administrator' : 'Mahasiswa' }}</span>
                </div>
            </div>

            <ul class="sidebar-menu">
                <li>
                    <a href="{{ route('logout') }}"
                       onclick="event.preventDefault(); document.getElementById('logout-form').submit();">

                        <span class="sidebar-icon">↪</span>
                        <span>Keluar</span>
                    </a>
                </li>
            </ul>

            <form id="logout-form"
                  action="{{ route('logout') }}"
                  method="POST"
                  hidden>
                @csrf
            </form>

        </div>

    </aside>

    {{-- KONTEN UTAMA --}}
    <main class="main-content">

        <header class="top-header">

            <div class="page-heading">
                <h1>@yield('heading', 'Dashboard')</h1>

                <p>
                    @yield('subtitle', 'Sistem Absensi Mahasiswa TRI Politeknik Amamapare')
                </p>
            </div>

            <div class="header-user">

                <div class="user-avatar">
                    {{ strtoupper(substr($pengguna->nama, 0, 1)) }}
                </div>

                <div class="user-info">
                    <h4>{{ $pengguna->nama }}</h4>

                    <span>
                        {{ $adminAktif ? 'Administrator' : 'Mahasiswa' }}
                    </span>
                </div>

            </div>

        </header>

        @if (session('success'))
            <div class="alert-success">
                {{ session('success') }}
            </div>
        @endif

        @if (session('error'))
            <div class="alert-error">
                {{ session('error') }}
            </div>
        @endif

        @yield('content')

        <footer class="dashboard-footer">
            © {{ date('Y') }} Sistem Absensi Mahasiswa TRI
            · Politeknik Amamapare
        </footer>

    </main>

</div>

@stack('scripts')

</body>
</html>
