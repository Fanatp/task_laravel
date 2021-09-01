<?php

namespace App\Http\Controllers;

use App\Models\Institution;
use App\Models\Profession;
use App\Models\Skill;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use function React\Promise\all;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {

        $proffs = Profession::all();


        if(Auth::check()){
            $token = \auth()->user()->createToken("auth_token");
        }


        return view('home',['proff'=> $proffs]);
    }

    public function user_token (){
        if(Auth::check()){
            return auth()
                ->user()
                ->createToken('auth_token', ['admin'])
                ->plainTextToken;
        }
    return redirect()->route('home');
    }

    public function info (){

        if(Auth::check()){
            $token = \auth()->user()->createToken("auth_token");
        }


        return view('info',['token'=> $token->plainTextToken]);
    }


}
