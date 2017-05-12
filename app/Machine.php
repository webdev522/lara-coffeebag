<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Machine extends Model
{
    //

    public function getName() {
        return $this->name;
    }
}
