<?php

namespace Database\Seeders;

use Faker\Core\Number;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class Fake extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for( $i=0; $i < 12; $i++){
            DB::table('skills')->insert([
                'name' => Str::random(5),
                'display_name' => 'institution   '.Str::random(10),
                'profession_id' => '12',
            ]);
        }


    }

}
