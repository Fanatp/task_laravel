@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                       Токен API: {{$token}} <Br><Br>

                        Получить токен можна перезагрузив эту страницу ,или отправив POST запрос на  "{{url('/api/login') }}" - в ответ придет JSON токен и данные пользователя.
                        <Br><Br>
                        Данные пользователя для авторизации :
                        <Br><Br>
                        <b>login:</b> admin@admin.com<Br>
                        <b>password :</b> password
                        <Br><Br>
                    <hr>
                        <Br><Br>

                        {{url('/api/skills') }}  - получить все навыки JSON<br><br>
                        {{url('/api/answer ') }}  - получить все профессии и учебные заведения по навыку JSON<br><br>

                        POST запрос JSON <br><br>
  <code> <pre>
        {
        "skill": 3,
        "skill2": 5,
        "skill3": 8
        }
    </pre></code>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
