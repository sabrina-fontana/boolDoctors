@extends('layouts.app')

@section('title', 'Messaggi')

@section('content')

<div class="container relative">

    <button class="btn button-none">
        <a href="{{ route('dashboard') }}">
            <i class="fas fa-arrow-left"></i>
        </a>
    </button>
    <h1 class="custom-h1 inline-b">Messaggi ricevuti</h1>

    @if ($userMessages->isEmpty())
    <div class="card relative">
        <br>
        <div class="card-body">
            <h5 class="card-title">
                Nessun Messaggio
            </h5>
            <p class="card-text">Al momento non ci sono nuovi messaggi</p>
        </div>
    </div>
    @else
    @foreach ($userMessages as $message)
    @php
        $time = strtotime($message->created_at) + 7200; // Add 2 hours
        $newDate = date('Y-m-j H:i:s', $time); // Back to string
        $message->created_at = $newDate;
    @endphp
    <div class="card message relative">
        <div class="card-body">
            <h5 class="card-title">
                Da: {{ $message->msg_name }} {{ $message->msg_lastname }}
            </h5>
            <h6 class="card-subtitle mb-2 text-muted">
                <div>Il {{ substr($message->created_at, 0, 10) }} alle {{ substr($message->created_at, 11, 5) }}</div>
                <div class="message-mail">{{ $message->msg_email }}</div>
                <div><a href="tel: {{ $message->msg_phone_number }}">{{ $message->msg_phone_number }}</a></div>
            </h6>
            <p class="card-text msg-p">{{ $message->msg_content }}</p>
        </div>
    </div>

    @endforeach
    @endif

</div>

@endsection
