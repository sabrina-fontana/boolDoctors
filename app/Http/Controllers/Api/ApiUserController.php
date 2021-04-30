<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\User;
use App\Specialization;

class ApiUserController extends Controller
{
    public function index(Request $request)
    {
        $specialization = $request->query('specialization');

        if ($specialization > 0) {
            $filtered = User::with('specializations', 'reviews', 'sponsorships')->whereHas('specializations', function ($query) use ($specialization) {
                return $query->where('specialization_id', $specialization);
            })->get();
        } else {
            $filtered = User::with('specializations', 'reviews', 'sponsorships')->get();
        }
        return response()->json($filtered);
    }
}
