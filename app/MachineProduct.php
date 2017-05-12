<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Product;

class MachineProduct extends Model
{
    //

    public function getProductName() {
        $product = Product::where('id', $this->product_id)->first();
        return $product->name;
    }
}
