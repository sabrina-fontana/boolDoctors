@extends('layouts.app')
@section('title', 'Index')
@section('content')

    <div class="container">
        <index-component :selected="{{$selected}}" :specializations="{{$specializations}}"></index-component>
    </div>

@endsection
