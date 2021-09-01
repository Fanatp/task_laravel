<?php


use App\Models\Profession;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use TCG\Voyager\Facades\Voyager;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get("/info", [App\Http\Controllers\HomeController::class, 'info'])->name('info');


Route::post('/tokens/create', function (Request $request) {

    $token = $request->user()->createToken($request->token_name);

    return $token->plainTextToken;

})->name('token_create');

Route::get('/user_token', [\App\Http\Controllers\HomeController::class, 'user_token'])->name('user_token');


Route::get('token', function (){

        return view('token');
})->name('token');
