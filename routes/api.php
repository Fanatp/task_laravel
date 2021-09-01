<?php

use App\Http\Controllers\ApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['middleware' => 'auth:sanctum'], function() {

    Route::post('/user_all', [ApiController::class, 'all_user']);
    Route::post('/skills', [ApiController::class, 'skills']);
    Route::post('/answer', [ApiController::class, 'answer']);


});

Route::post('/login', [ApiController::class, 'login']);
