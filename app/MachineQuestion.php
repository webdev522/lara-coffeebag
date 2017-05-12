<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Question;
class MachineQuestion extends Model
{
    //
    public function getQuestionName() {
        $question = Question::where('id', $this->question_id)->first();
        return $question->name;
    }
}
