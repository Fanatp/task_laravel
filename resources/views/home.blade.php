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
                        <a class="nav-link" href="{{ route('info') }}">Ифнормация по API</a>
                        <table class="table table-bordered border-primary">
                           <thead>
                           <tr>
                               <td>Профессия</td>
                               <td> Список навыков для профессии</td>
                               <td>Список учебных заведений для профессии</td>
                           </tr>
                           </thead>
                            <TBODY>
                            @foreach($proff as $prof)
                                <tr>
                                    <td>{{$prof->display_name}}</td>
                                    <td>
                                       @foreach($prof->skills as $skill)
                                            {{$skill['display_name']}} <br>
                                        @endforeach
                                    </td>
                                    <td>
                                        @foreach($prof->Institution as $inst)
                                            {{$inst['display_name']}} <Br>
                                        @endforeach
                                    </td>
                                </tr>
                            @endforeach
                            </TBODY>
                        </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
