<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profession extends Model
{
    use HasFactory;

    public function Institution(){
        return $this->hasMany(Institution::class);
    }

    public function Skills(){
        return $this->hasMany(Skill::class);
    }


}
