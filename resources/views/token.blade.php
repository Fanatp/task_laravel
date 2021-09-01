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

                    <form action="{{route('token_create')}}" method="post">
                        @csrf
                        <input type="hidden" name="token_name" value="token">
                        <input type="submit" value="Create Token">

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
