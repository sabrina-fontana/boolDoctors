<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>BDoctors - Sponsorizzazioni</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans&display=swap" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
        integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
        crossorigin="anonymous" />

</head>

<body class="layout">
    <nav id="main-nav" class="navbar navbar-expand navbar-light">
        <div class="container">
            <a class="navbar-brand" href="{{ url('/') }}" style="font-size: 30px">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHK4VZoPGy-_lCyOFjKY-FTDHq9B057V0Hj-tYYGYiL1r9MlTdLz409t0fp4AvQuciiDg&usqp=CAU"
                    alt=""> BDoctors
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse nav-right" id="navbarSupportedContent">
                <!-- Left Side Of Navbar -->
                <ul class="navbar-nav mr-auto">

                </ul>

                <!-- Right Side Of Navbar -->
                <ul class="navbar-nav ml-auto">
                    <!-- Authentication Links -->
                    @guest
                    <li class="nav-item nav-item-guest">
                        <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                    </li>
                    @if (Route::has('register'))
                    <li class="nav-item nav-item-guest">
                        <a class="nav-link" href="{{ route('create') }}">{{ __('Registrati') }}</a>
                    </li>
                    @endif
                    @else
                    <li class="nav-item dropdown nav-item-user">
                        <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                            {{ Auth::user()->name }}
                        </a>

                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a id="dropp" class="dropdown-item" href="{{ route('dashboard') }}">
                                DashBoard
                            </a>
                            <a id="dropp" class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault();
                                document.getElementById('logout-form').submit();">
                                {{ __('Logout') }}
                            </a>


                            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                @csrf
                            </form>
                        </div>
                    </li>
                    @endguest
                </ul>
            </div>
        </div>
    </nav>

    <main class="container sponsor-page">
        
        <div class="title">
            <button class="button-none">
                <a href="{{route('dashboard', compact('user'))}}"><i class="fas fa-arrow-left"></i></a>
            </button>
            Sponsorizzazioni
        </div>

        <form class="card" method="post" id="payment-form" style="padding: 20px"
            action="{{ route('checkout', compact('user')) }}">
            @csrf
            @method('POST')
            @if (session('success_message'))
            <div class="alert alert-success">
                {{ session('success_message') }}
                <a href="{{route('dashboard', compact('user'))}}">Torna alla dashboard</a>
            </div>

            @endif
    
            @if (count($errors) > 0)
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif
            
            @if(!session('success_message'))
                <div class="form-content">
                    <div class="text">Scegli una sponsorizzazione per apparire tra i medici in evidenza nella homepage!</div>
                    <div class="spons-container">
                        @foreach($sponsorships as $sponsor)
                            <input type="radio" id="{{$sponsor->sponsor_name}}" name="amount" value="{{$sponsor->sponsor_price}}">
                            <label class="card" for="{{$sponsor->sponsor_name}}">
                                <div class="sponsor-name">{{$sponsor->sponsor_name}} </div>
                                <div>durata: {{$sponsor->sponsor_duration}} ore</div>
                                <div>{{$sponsor->sponsor_price}} €</div>
                            </label>
                        @endforeach
                    </div>

                    <section>
                        <div class="bt-drop-in-wrapper">
                            <div id="bt-dropin"></div>
                        </div>
                    </section>

                    <input id="nonce" name="payment_method_nonce" type="hidden" />
                    <button class="custom-button" type="submit"><span>Procedi al pagamento</span></button>
                </div>
            @endif
        </form>

    </main>

    <footer>
        <a href="{{ url('/') }}">
            Powered with love by Team 2 | www.bdoctors.it
        </a>
    </footer>

    <script src="https://js.braintreegateway.com/web/dropin/1.27.0/js/dropin.min.js"></script>
    <script>
        var form = document.querySelector('#payment-form');
        var client_token = "{{$token}}";

        braintree.dropin.create({
        authorization: client_token,
        selector: '#bt-dropin',
        paypal: {
            flow: 'vault'
        }
        }, function (createErr, instance) {
        if (createErr) {
            console.log('Create Error', createErr);
            return;
        }
        form.addEventListener('submit', function (event) {
            event.preventDefault();

            instance.requestPaymentMethod(function (err, payload) {
            if (err) {
                console.log('Request Payment Method Error', err);
                return;
            }

            // Add the nonce to the form and submit
            document.querySelector('#nonce').value = 'fake-valid-visa-nonce';
            console.log(document.querySelector('#nonce').value)
            form.submit();
            });
        });
        });
    </script>
    <script src="{{ asset('js/app.js') }}" defer></script>
</body>

</html>
