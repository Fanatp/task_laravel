<?php

namespace App\Http\Controllers;

use App\Models\Institution;
use App\Models\Profession;
use App\Models\Skill;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class ApiController extends Controller
{


    public function all_user(Request $request)
    {

            $user = DB::table('users')->get();
        if ($user){
        return $this->onSuccess($user, 'Користувачі');
     }
        return $this->onError(401, 'Unauthorized Access');

    }

    public function skills(Request $request)
    {

        $skills = DB::table('skills')->get();
        if ($skills){
            return $this->onSuccess($skills, 'Навики');
        }
        return $this->onError(401, 'Unauthorized Access');

    }

    public function answer(Request $request)
    {
        $proffs = Profession::all();
        $skills = array();
        $pro = array();
        $ins = Institution::all();
        $instit = array();
        $profession = array();
        if ($request->accepts(['text/html', 'application/json'])) {

            $inputs = $request->all();

            foreach ($inputs as $input) {
                $db = Skill::find($input);
                if($db){
                    $skills[] = $db->display_name;
                    $pro[] = $db->profession_id;
                }

            }

            foreach ($pro as $id){
                foreach ($proffs as $proff) {
                    if($id == $proff->id){
                        $profession[] = $proff->display_name;
                    }
                }
            }

            foreach ($pro as $id){
                foreach ($ins as $in) {
                    if($id == $in->profession_id){
                        $instit[] = $in->display_name;
                    }
                }
            }







            $full_data = [
                'skill' => $skills,
                'profession' => $profession,
                'institution' => $instit,
            ];

            return $this->onSuccess($full_data, 'JSON');
        }else{
            return $this->onError(401, 'Is not JSON?');
        }


}

    protected function onSuccess($data,  $message = '',  $code = 200)
    {
        return response()->json([
            'status' => $code,
            'message' => $message,
            'data' => $data,
        ], $code);
    }
    protected function onError( $code,  $message = '')
    {
        return response()->json([
            'status' => $code,
            'message' => $message,
        ], $code);
    }

    public function  check(Request $request)
    {

        $token = $request->bearerToken();

        return response()->json([
            'token' => $token,
        ]);
    }

        public function login(Request $request){

            $field = $request->validate([
                'email' => 'required',
                'password'=> 'required',
            ],[
                'email.reauired' => 'Email має бути вкзааним!',
                'password.reuired' => ' :attribute має бути вказаним!',
            ]);

            $user = User::where('email', $field['email'])->first();

            if(!$user || !Hash::check($field['password'], $user->password)){
                return response([
                   'message' => 'password is bad',
                ],401);
            }

            $token = $user->createToken('auth_token')->plainTextToken;

            $respons = [
                'user' => $user,
                'token' => $token,
            ];

                return  response($respons, 201);
        }

}
