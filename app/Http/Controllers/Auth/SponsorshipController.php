<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\User;
use App\Sponsorship;
use Braintree;

class SponsorshipController extends Controller
{
    public function buySponsorship(User $user)
    {
        $sponsorships = Sponsorship::all();
        $gateway = new Braintree\Gateway([
            'environment' => config('services.braintree.environment'),
            'merchantId' => config('services.braintree.merchantId'),
            'publicKey' => config('services.braintree.publicKey'),
            'privateKey' => config('services.braintree.privateKey'),
        ]);

        $token = $gateway->ClientToken()->generate();
        return view('auth.sponsorships', ['user' => $user, 'sponsorships' => $sponsorships, 'token' => $token]);
    }
}
