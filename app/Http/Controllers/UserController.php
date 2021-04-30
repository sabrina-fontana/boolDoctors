<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Message;
use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Hash;
use App\Specialization;
use App\Review;
use Faker\Provider\ar_JO\Internet;
use DateInterval;
use DateTime;

class UserController extends Controller
{
    public function home()
    {
        date_default_timezone_set('Europe/Rome');
        $users = User::all();
        $sponsoredUsers = User::has('sponsorships')->get();
        $currentDate = date("Y-m-d H:i:s");
        $activeSponsorship = [];

        foreach ($sponsoredUsers as $user) {
            foreach ($user->sponsorships as $sponsorship) {
                if ($sponsorship->pivot->expiration_time > $currentDate) {
                    if (!in_array($user, $activeSponsorship)) {
                        array_push($activeSponsorship, $user);
                    }
                }
            }
        };

        $specializations = Specialization::has('users')->get();
        return view('public.homepage', compact('users', 'specializations', 'activeSponsorship'));
    }

    public function toIndex(Request $request)
    {
        $selected = $request->input('specialization');
        $specializations = Specialization::has('users')->get();

        return view('public.index', compact('selected', 'specializations'));
    }

    public function show(User $user, $spec)
    {
        $reviews = Review::all()->reverse();
        return view('public.show', compact('user', 'reviews', 'spec'));
    }

    public function create()
    {
        $specs = Specialization::all();
        return view('auth.register', compact('specs'));
    }
}
