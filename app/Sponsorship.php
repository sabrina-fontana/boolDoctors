<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sponsorship extends Model
{

    protected $fillable = [
        'sponsor_name', 'sponsor_duration', 'sponsor_price'
    ];

    public function users()
    {
        return $this->belongsToMany('App\User')->withPivot('expiration_time')->withTimestamps();
    }
}
