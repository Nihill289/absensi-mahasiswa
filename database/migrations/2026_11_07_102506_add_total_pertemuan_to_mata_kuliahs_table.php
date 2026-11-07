<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (! Schema::hasColumn('mata_kuliahs', 'total_pertemuan')) {
            Schema::table('mata_kuliahs', function (Blueprint $table) {
                $table->unsignedTinyInteger('total_pertemuan')->default(14);
            });
        }
    }

    public function down(): void
    {
        //
    }
};