<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',  'lastname', 'address', 'email', 'password', 'phone_number'
    ];

    public function reviews()
    {
        return $this->hasMany('App\Review');
    }

    public function messages()
    {
        return $this->hasMany('App\Message');
    }

    public function services()
    {
        return $this->hasMany('App\Service');
    }

    public function specializations()
    {
        return $this->belongsToMany('App\Specialization')->withPivot(['user_id', 'specialization_id'])->withTimestamps();
    }

    public function sponsorships()
    {
        return $this->belongsToMany('App\Sponsorship')->withPivot('expiration_time')->withTimestamps();
    }
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
