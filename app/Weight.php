<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Weight extends Model
{
    //
    public function getDate() {
        return date_format($this->created_at ,"m/d/y");
    }

    public function getTime() {
        return date_format($this->created_at ,"h:i a");
    }

    public function getAverage() {
        return sprintf("%.2f", $this->total / $this->count);
    }
}
