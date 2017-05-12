@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">Select a Machine</div>
                @php
                    $idx = 0
                @endphp
                <div class="panel-body">
                @foreach ($machines as $machine)
                    @php
                        $idx++;
                    @endphp
                    @if ($idx % 2 == 1)
                        <div class="row">
                    @endif
                        <div class="col-md-6 text-center"><a class="btn btn-primary btn-machine" href="/machineproducts/{{ $machine-> id }}">{{ $machine->name }}</a></div>
                    @if ($idx % 2 == 0)
                        </div>
                    @endif
                @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
@endsection