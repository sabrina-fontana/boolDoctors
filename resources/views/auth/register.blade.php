@extends('layouts.app')
@section('title', 'Register')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card register-card">
                <h2 class="custom-h1">Registrati</h2>

                <div class="card-body">
                    <form method="POST" action="{{ route('register') }}" onsubmit="return verificapassword(this)" class="needs-validation" novalidate>
                        @csrf

                        {{-- NOME --}}
                        <div class="form-group row">
                            <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Nome') }}</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror"
                                    name="name" value="{{ old('name') }}" required autocomplete="name" autofocus
                                    minlength="3" maxlength="50">

                                @error('name')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                                <div class="invalid-feedback">Inserisci il nome.</div>
                            </div>
                        </div>

                        {{-- COGNOME --}}
                        <div class="form-group row">
                            <label for="lastname"
                                class="col-md-4 col-form-label text-md-right">{{ __('Cognome') }}</label>

                            <div class="col-md-6">
                                <input id="lastname" type="text"
                                    class="form-control @error('lastname') is-invalid @enderror" name="lastname"
                                    value="{{ old('lastname') }}" required autocomplete="lastname" autofocus
                                    minlength="3" maxlength="50">

                                @error('lastname')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                                <div class="invalid-feedback">Inserisci il cognome.</div>
                            </div>
                        </div>

                        {{-- SPECIALIZZAZIONE --}}
                        <div class="form-group">
                            <label for="specializations"
                                class="col-md-4 col-form-label text-md-right">{{ __('Specializzazioni') }}</label>
                            <select class="form-control custom-select" id="specializations" name="specializations[]"
                                multiple required>
                                <option value="">Seleziona una o più specializzazioni</option>
                                @foreach ($specs as $spec)
                                <option value="{{ $spec->id }}">{{ $spec->spec_name }}</option>
                                @endforeach
                            </select>
                            <div class="invalid-feedback invalid-spec">Inserisci una o più specializzazioni.</div>
                        </div>

                        {{-- INDIRIZZO --}}
                        <div class="form-group row">
                            <label for="address"
                                class="col-md-4 col-form-label text-md-right">{{ __('Indirizzo') }}</label>

                            <div class="col-md-6">
                                <input id="address" type="text"
                                    class="form-control @error('address') is-invalid @enderror" name="address"
                                    value="{{ old('address') }}" required autocomplete="address" autofocus
                                    minlength="15">

                                @error('address')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                                <div class="invalid-feedback">Inserisci l'indirizzo.</div>

                            </div>
                        </div>

                        {{-- EMAIL --}}
                        <div class="form-group row">
                            <label for="email"
                                class="col-md-4 col-form-label text-md-right">{{ __('Indirizzo Email') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror"
                                    name="email" value="{{ old('email') }}" required autocomplete="email">

                                @error('email')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                                <div class="invalid-feedback">Inserisci l'indirizzo email.</div>
                            </div>
                        </div>

                        {{-- PASSWORD --}}
                        <div class="form-group row">
                            <label for="password"
                                class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label>

                            <div class="col-md-6">
                                <input id="password" type="password"
                                    class="form-control @error('password') is-invalid @enderror" name="password"
                                    required autocomplete="new-password" minlength="8">

                                @error('password')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                                <div class="invalid-feedback">Scegli una password.</div>
                            </div>
                        </div>

                        {{-- CONFERMA PASSWORD --}}
                        <div class="form-group row">
                            <label for="password-confirm"
                                class="col-md-4 col-form-label text-md-right">{{ __('Conferma Password') }}</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control"
                                    name="password_confirmation" required autocomplete="new-password" minlength="8">
                            </div>
                        </div>

                        {{-- PULSANTE --}}
                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn custom-button">
                                    {{ __('Registrati') }}
                                </button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
