<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\User;

class ManageUsersController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index() {
        $users = DB::select('select * from users');// where name <> :name', ['name' => Auth::user()->name]);
        return view('manageusers', ['users' => $users]);
    }

    public function add(Request $request) {
        $name = $request->input('name');
        $username = $request->input('username');
        // $email = $request->input('email');
        $password = $request->input('password');

        $this->validate($request, [
            'name' => 'required|max:255',
            'username' => 'required|min:6|unique:users',
            // 'email' => 'required|email|max:255|unique:users',
            'password' => 'required|min:6',
        ]);
        // bcrypt($password);
        // DB::insert('insert into users (name, username, email, password) values (?, ?, ?, ?)', [$name, $username, $email, bcrypt($password)]);
        User::create([
            'name' => $name,
            'username' => $username,
            // 'email' => $username . '@xxx.xxx',
            'password' => bcrypt($password),
            'role' => ''
        ]);

        return redirect('/manageusers');
    }

    public function delete(Request $request) {
        $username = $request->input('username');

        if ($username != null) {
            $deleted = DB::delete('delete from users where username=:username', ['username' => $username]);
        }
        return redirect('/manageusers');
    }
}
