<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Specialization;

class SpecializationController extends Controller
{
    public function index()
    {
        return response()->json(Specialization::all());
    }
}
