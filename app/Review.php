<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{

    protected $fillable = [
        'rv_name', 'rv_lastname', 'rv_vote', 'rv_title', 'rv_content', 'user_id'
    ];

    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
