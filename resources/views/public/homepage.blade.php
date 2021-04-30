@extends('layouts.app')
@section('title', 'Home')
@section('content')

<div class="jum">
    <div class="container jum-container">
        <div class="jum-left">
            <div class="jum-title">CERCA IL DOTTORE ADATTO A TE</div>

            <form action="{{ route('toIndex') }}" method="post">
                @csrf
                @method('GET')

                <div class="form-group">

                    {{-- select specializzazioni --}}
                    <select class="form-control col-auto" id="specialization" name="specialization" required>
                        <option value="">Seleziona la specializzazione</option>
                        @foreach ($specializations as $spec)
                        <option value="{{ $spec->id }}" class="opt">{{ $spec->spec_name }}</option>
                        @endforeach
                    </select>
                    {{-- pulsante di ricerca --}}
                    <button class="search custom-button" type="submit">
                        Cerca
                    </button>
                </div>
            </form>
        </div>

        <img src="https://media.discordapp.net/attachments/831086712775376901/836165547225251870/img-removebg-preview.png"
            alt="">
    </div>
</div>

<div class="container evidence">


    <h2 class="title">Medici in evidenza</h2>
    <div class="container evidence-card">
        {{-- card medico in evidenza --}}
        @foreach ($activeSponsorship as $theuser)
        <div>
            <a href="/doctors/{{$theuser->id}}/{{$theuser->specializations}} ">
                <div class="card">
                    <img src="{{$theuser->profile_image}}" alt="" class="user-image">
                    <h4 class="doctor-name">{{ $theuser->name }} {{ $theuser->lastname }}</h4>
                    @foreach ($theuser->specializations as $spec)
                    {{ $spec->spec_name }} <br>
                    @endforeach
                </div>
            </a>
        </div>
        @endforeach
    </div>
</div>
@endsection
