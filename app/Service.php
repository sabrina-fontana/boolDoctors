<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    protected $fillable = [
        'service_type', 'service_price', 'service_address'
    ];

    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
