<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Product;
use App\Machine;
use App\MachineProduct;

class MachineProductsController extends Controller
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
    public function index()
    {
       return 'empty';
    }

    public function show($machine_id) {
        $machineproducts = MachineProduct::where('machine_id', $machine_id)
                                ->orderBy('id', 'asc')
                                ->get();
        $machine = Machine::where('id', $machine_id)->first();
        $machinename = $machine->getName();
        return view('machineproducts', ['machineproducts' => $machineproducts, 'machinename' => $machinename]);
    }
}
