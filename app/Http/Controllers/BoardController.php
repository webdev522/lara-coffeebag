<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Weight;
use App\Machine;
use App\Product;
use App\MachineProduct;
use App\MachineQuestion;
use App\Answer;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class BoardController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($board_id)
    {
        $machineproduct = MachineProduct::where('id', $board_id)->first();
        $weights = null;
        $user_id = Auth::user()->id;
        $user_name = Auth::user()->name;
        $machine_id = $machineproduct->machine_id;
        $product_id = $machineproduct->product_id;
        // $today = Carbon::now();

        if ($machineproduct != null) {
            $weights = Weight::where('user_id', $user_id)
                            ->where('machine_product_id', $board_id)
                            ->whereDate('created_at', '=', Carbon::today()->toDateString())
                            ->get();
        }

        $machine = Machine::where('id', $machine_id)->first();
        $product = Product::where('id', $product_id)->first();
        $machine_product_fullname = $machine->getName() . ' - ' . $product->getName();

        $machinequestions = MachineQuestion::where('machine_id', $machine_id)->get();
        
        return view('board', ['weights' => $weights, 'machinequestions' => $machinequestions, 'board_id' => $board_id, 'user_name' => $user_name, 'machine_product_fullname' => $machine_product_fullname]);
    }

    public function add(Request $request, $board_id) {
        $user_id = Auth::user()->id;
        $total = $request->input('weight');
        $count = $request->input('count');
        $answers = $request->input('answers');

        $this->validate($request, [
            'weight' => 'required|numeric|min:0',
            'count' => 'required|integer|min:1',
        ]);
        
        $total = number_format($total, 2);
        $weight = new Weight;
        $weight->user_id = $user_id;
        $weight->total = $total;
        $weight->count = $count;
        $weight->machine_product_id = $board_id;
        $weight->save();

        if ($answers != null) {
            foreach ($answers as $value) {
                $answer = new Answer;
                $answer->user_id = $user_id;
                $answer->machine_question_id = $value;
                $answer->save();
            }
        }

        return redirect('board/' . $board_id);//, ['board_id' => $board_id]);
    }
}
