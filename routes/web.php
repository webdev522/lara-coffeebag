<?php

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

// Route::get('/', function () {
//     return view('welcome');
// });

Auth::routes();

Route::get('/', 'MachineController@index');

Route::get('/machineproducts/{machine_id}', 'MachineProductsController@show');

Route::get('/board/{board_id}', 'BoardController@index');

Route::post('/board/add/{board_id}', 'BoardController@add');

Route::post('/updatepassword/new', 'UpdatePasswordController@newpassword');

Route::get('/updatepassword', 'UpdatePasswordController@index');

Route::get('/manageusers', 'ManageUsersController@index');

Route::post('/manageusers/add', 'ManageusersController@add');

Route::post('/manageusers/delete/', 'ManageUsersController@delete');