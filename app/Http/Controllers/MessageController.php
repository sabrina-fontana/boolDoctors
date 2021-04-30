<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Review;
use App\Message;
use App\User;

class MessageController extends Controller
{
    public function saveMessage(Request $request, User $user, $spec)
    {
        $this->messageValidation($request);
        $newMessage = new Message();
        $newMessage->fill($request->all());
        $newMessage->user_id = $user->id;
        $newMessage->save();
        return redirect()->route('show', compact('user', 'spec'));
    }

    // validazione messaggi
    protected function messageValidation(Request $request)
    {
        $request->validate([
            'msg_name' => 'required|string|min:3|max:50',
            'msg_lastname' => 'required|string|min:3|max:50',
            'msg_email' => 'required|email',
            'msg_phone_number' => 'required|string|min:9|max:10',
            'msg_content' => 'required|string|min:30'
        ]);
    }
}
