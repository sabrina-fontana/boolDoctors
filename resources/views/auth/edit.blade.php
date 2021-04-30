@extends('layouts.app')
@section('title', 'Edit')
@section('content')

<div class="container">

    <div class="card edit-card relative">

        {{-- PULSANTE CHE TORNA ALLA DASHBOARD --}}
        <div class="back">
            <button class="btn button-none">
                <a href="{{ route('dashboard') }}">
                    <i class="fas fa-arrow-left"></i>
                </a>
            </button>
            <h1 class="custom-h1">Modifica qui i tuoi dati</h1>
        </div>

        <div class="form">
            <form action="{{ route('update', compact('user')) }}" method="post" enctype="multipart/form-data">
                @csrf
                @method('PUT')

                {{-- NOME --}}
                <div class="form-group">
                    <label for="name">Nome</label>
                    <input type="text" class="form-control" name="name" aria-describedby="emailHelp"
                        placeholder="Inserisci il nome..." value="{{ $user->name }}" required minlength="3"
                        maxlength="50">
                </div>

                {{-- COGNOME --}}
                <div class="form-group">
                    <label for="lastname">Cognome</label>
                    <input type="text" class="form-control" name="lastname" placeholder="Inserisci il cognome..."
                        value="{{ $user->lastname }}" required minlength="3" maxlength="50">
                </div>

                {{-- SPECIALIZZAZIONE --}}
                <div class="form-group">
                    <label for="specializations">Specializzazione</label>
                    <select class="form-control" id="specializations" name="specializations[]" multiple required>
                        <option value="">nessuno</option>
                        @foreach ($specs as $spec)
                        <option value="{{ $spec->id }}" @foreach ($user->specializations as $userSpec)
                            @if($userSpec->id===$spec->id)
                            selected @endif
                            @endforeach
                            >{{ $spec->spec_name }}</option>
                        @endforeach
                    </select>
                </div>

                {{-- EMAIL --}}
                <div class="form-group">
                    <label for="email">Mail</label>
                    <input type="email" class="form-control" name="email" placeholder="Inserisci la mail..."
                        value="{{ $user->email }}" required>
                </div>

                {{-- INDIRIZZO --}}
                <div class="form-group">
                    <label for="address">Indirizzo</label>
                    <input type="text" class="form-control" name="address" placeholder="Inserisci l'indirizzo..."
                        value="{{ $user->address }}" required minlength="15">
                </div>

                {{-- NUMERO DI TELEFONO --}}
                <div class="form-group">
                    <label for="phone_number">Numero di telefono</label>
                    <input type="text" class="form-control" name="phone_number"
                        placeholder="Inserisci il numero di telefono..." value="{{ $user->phone_number }}" minlength="9"
                        maxlength="10">
                </div>

                {{-- IMMAGINE DI PROFILO --}}
                <div class="form-group">
                    <label for="profile_image">Immagine di profilo</label>
                    <input type="file" class="input-file" name="profile_image"
                        placeholder="Inserisci un'immagine di profilo..." value="{{ $user->profile_image }}">
                </div>

                {{-- CURRICULUM --}}
                <div class="form-group">
                    <label for="curriculum">Curriculum</label>
                    <input type="file" class="input-file" name="curriculum" placeholder="Inserisci il curriculum..."
                        value="{{ $user->curriculum }}">
                </div>

                {{-- PULSANTE DI MODIFICA --}}
                <div class="modifica">
                    <button type="submit" class="btn custom-button">Modifica</button>
                </div>


            </form>

        </div>

    </div>
</div>

@endsection
