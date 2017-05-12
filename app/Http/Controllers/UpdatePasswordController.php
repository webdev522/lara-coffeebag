<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class UpdatePasswordController extends Controller
{
    //

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index() {
        return view('updatepassword');
    }

    public function newpassword(Request $request) {
        $newpassword = $request->input('newpassword');
        $this->validate($request, [
            'newpassword' => 'required|min:6'
        ]);
        $user_id = Auth::user()->id;
        $affected = DB::update('update users set password = ? where id = ?', [bcrypt($newpassword), $user_id]);
        Auth::logout();
        return redirect('/');
    }
}
