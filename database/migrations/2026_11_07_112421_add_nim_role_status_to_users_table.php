<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('nim', 20)->nullable()->unique()->after('id');
            $table->string('role', 20)->default('mahasiswa')->after('password');
            $table->string('status', 20)->default('aktif')->after('role');
        });
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropUnique(['nim']);
            $table->dropColumn(['nim', 'role', 'status']);
        });
    }
};