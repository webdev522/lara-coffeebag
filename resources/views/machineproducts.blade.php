@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">{{ $machinename }}</div>
                @php
                    $idx = 0
                @endphp
                <div class="panel-body">
                   
                @foreach ($machineproducts as $machineproduct)
                    @php
                        $idx++;
                    @endphp
                    @if ($idx % 3 == 1)
                        <div class="row">
                    @endif
                        <div class="col-md-4 text-center">
                            <a class="btn btn-primary btn-machineproduct" href="/board/{{ $machineproduct-> id }}">{{ $machineproduct->getProductName() }}</a>
                        </div>
                    @if ($idx % 3 == 0)
                    </div>
                    @endif
                @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
@endsection