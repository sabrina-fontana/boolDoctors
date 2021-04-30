<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    protected $fillable = [
        'msg_name', 'msg_lastname', 'msg_email', 'msg_phone_number', 'msg_content'
    ];

    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
