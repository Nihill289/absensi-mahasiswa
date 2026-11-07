
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Masuk - Absensi TRI</title>

    <link rel="stylesheet" href="{{ asset('css/login.css') }}?v=2">
</head>

<body class="login-page">

    <main class="login-wrapper">

        {{-- PANEL KIRI --}}
        <section class="login-banner">

            <div class="login-brand">

                <div class="login-logo">
                    TRI
                </div>

                <h2>Absensi Mahasiswa TRI</h2>

                <p>Politeknik Amamapare</p>

            </div>

            <div class="login-banner-content">

                <span class="login-welcome">
                    SISTEM INFORMASI AKADEMIK
                </span>

                <h1>
                    Selamat Datang<br>
                    di Sistem Absensi
                </h1>

                <p>
                    Sistem informasi absensi mahasiswa Program Studi
                    Teknik Rekayasa Internet untuk memantau kehadiran
                    dan progres perkuliahan secara digital.
                </p>

                <div class="login-feature">
                    <div class="login-feature-icon">✓</div>
                    <span>Monitoring kehadiran mahasiswa</span>
                </div>

                <div class="login-feature">
                    <div class="login-feature-icon">▦</div>
                    <span>Kalender akademik terintegrasi</span>
                </div>

                <div class="login-feature">
                    <div class="login-feature-icon">▤</div>
                    <span>Statistik progres perkuliahan</span>
                </div>

            </div>

            <div class="login-banner-footer">
                © {{ date('Y') }} Politeknik Amamapare
            </div>

        </section>


        {{-- PANEL KANAN --}}
        <section class="login-form-panel">

            <div class="login-heading">

                <div class="login-heading-icon">
                    <span>👨‍🎓</span>
                </div>

                <h2>Masuk Akun</h2>

                <p>
                    Silakan masuk menggunakan NIM dan kata sandi
                    yang telah terdaftar.
                </p>

            </div>


            {{-- PESAN ERROR --}}
            @if ($errors->any())

                <div class="login-alert login-alert-error" role="alert">
                    <span>!</span>
                    <div>
                        {{ $errors->first() }}
                    </div>
                </div>

            @endif


            {{-- PESAN SESSION --}}
            @if (session('error'))

                <div class="login-alert login-alert-error" role="alert">
                    {{ session('error') }}
                </div>

            @endif

            @if (session('success'))

                <div class="login-alert login-alert-success" role="status">
                    {{ session('success') }}
                </div>

            @endif


            {{-- FORM LOGIN --}}
            <form
                action="{{ route('login.process') }}"
                method="POST"
                class="form-login"
            >

                @csrf

                <div class="login-form-group">

                    <label for="nim">
                        Nomor Induk Mahasiswa
                    </label>

                    <div class="login-input-wrapper">

                        <input
                            id="nim"
                            type="text"
                            name="nim"
                            value="{{ old('nim') }}"
                            placeholder="Contoh: 2511009"
                            autocomplete="username"
                            inputmode="numeric"
                            required
                            autofocus
                        >

                    </div>

                </div>


                <div class="login-form-group">

                    <label for="password">
                        Kata Sandi
                    </label>

                    <div class="login-input-wrapper">

                        <input
                            id="password"
                            type="password"
                            name="password"
                            class="login-password"
                            placeholder="Masukkan kata sandi"
                            autocomplete="current-password"
                            required
                        >

                        <button
                            type="button"
                            class="login-show-password"
                            id="togglePassword"
                            aria-label="Tampilkan kata sandi"
                        >
                            Lihat
                        </button>

                    </div>

                </div>


                <button type="submit" class="login-button">

                    <span>Masuk ke Dashboard</span>

                    <span class="login-button-arrow">→</span>

                </button>

            </form>


            <div class="login-security">
                <span>🔒</span>
                <p>Akses aman untuk pengguna terdaftar.</p>
            </div>


            <div class="login-footer">

                <p>Sistem Absensi Mahasiswa TRI</p>
                <span>Politeknik Amamapare · {{ date('Y') }}</span>

            </div>

        </section>

    </main>


    {{-- JAVASCRIPT TAMPILKAN PASSWORD --}}
    <script>
        document.addEventListener('DOMContentLoaded', function () {

            const passwordInput = document.getElementById('password');
            const togglePassword = document.getElementById('togglePassword');

            togglePassword.addEventListener('click', function () {

                const isPassword = passwordInput.type === 'password';

                passwordInput.type = isPassword ? 'text' : 'password';

                togglePassword.textContent = isPassword
                    ? 'Sembunyikan'
                    : 'Lihat';

                togglePassword.setAttribute(
                    'aria-label',
                    isPassword ? 'Sembunyikan kata sandi' : 'Tampilkan kata sandi'
                );

            });

        });
    </script>

</body>
</html>
