<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Service;
use App\Specialization;
use Illuminate\Http\Request;
use App\User;

class PrivateUserController extends Controller
{

    public function showMessages($id)
    {
        $userMessages = User::find($id)->messages->reverse();
        return view('auth.message', compact('userMessages'));
    }

    public function newService(Request $request, User $user)
    {
        $this->serviceValidation($request);
        $newService = new Service();
        $newService->fill($request->all());
        $newService->user_id = $user->id;
        $newService->save();
        return redirect()->route('dashboard', compact('user'));
    }

    public function edit(User $user)
    {
        $specs = Specialization::all();
        return view('auth.edit', compact('user', 'specs'));
    }

    public function update(Request $request, User $user)
    {

        $this->updateValidation($request);
        if ($request->hasFile('profile_image')) {
            $img = $request->file('profile_image')->store('public');
            $user->profile_image = $img;
        }
        if ($request->hasFile('curriculum')) {
            $doc = $request->file('curriculum');
            $originalExtension = $request->file('curriculum')->getClientOriginalExtension();
            $doc->storeAs('public/', $user->name . "." . $originalExtension);
            $user->curriculum = 'public/' . $user->name . "." . $doc->clientExtension();
        }
        $user->update($request->all());

        $user->specializations()->detach();

        foreach ($request['specializations'] as $spec) {
            $user->specializations()->attach($spec);
        }

        return redirect()->route('dashboard');
    }

    public function destroy(User $user)
    {
        $user->specializations()->detach();
        $user->sponsorships()->detach();
        $user->services()->delete();
        $user->messages()->delete();
        $user->reviews()->delete();
        $user->delete();
        return redirect()->route('homepage');
    }

    // validazione di prestazioni e dettaglio dottore

    protected function serviceValidation(Request $request)
    {
        $request->validate([
            'service_type' => 'required|string|min:5',
            'service_price' => 'required|numeric|min:10',
            'service_address' => 'required|string|min:15'
        ]);
    }

    protected function updateValidation(Request $request)
    {
        $request->validate([
            'name' => 'required|string|min:3|max:50',
            'lastname' => 'required|string|min:3|max:50',
            'address' => 'required|string|min:15',
            'phone_number' => 'nullable|string|min:9|max:10',
            // 'curriculum' => 'nullable',
            // 'profile_image' => 'nullable',
            'email' => 'required|email'
        ]);
    }

    public function destroyService(User $user, $id) {
        $user->services()->where('id', $id)->delete();
        return redirect()->route('dashboard', compact('user'));
    }
}
