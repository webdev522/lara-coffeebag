@extends('layouts.app')

@section('content')
<div class="container">

    <!-- Input Form -->
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">{{ $machine_product_fullname }} (Input Form)</div>

                <div class="panel-body">
                     <form class="form-horizontal" action="/board/add/{{$board_id}}" method="POST">
                        {{ csrf_field() }}
                        <div class="form-group">
                            <label class="control-label col-sm-6" for="weight">Total Weight of Items:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="weight" name="weight" placeholder="Please Enter Positive Number">
                                @if ($errors->has('weight'))
                                    <span class="help-block">
                                        <strong>Please input valid value</strong>
                                    </span>
                                @endif
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-6" for="count">Number of Items Weighed:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="count" name="count" placeholder="Please Enter Number More Than 1">
                                @if ($errors->has('count'))
                                    <span class="help-block">
                                        <strong>Please input valid value</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-6" for="count">Number of Items Weighed:</label>
                            <label class="control-label col-sm-6" id="average"></label>
                        </div>
                        @if ($machinequestions != null)
                        @foreach ($machinequestions as $machinequestion)
                        <div class="form-group">
                            <div class="col-sm-6 col-sm-offset-3">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="answers[]" value="{{ $machinequestion->id }}">{{ $machinequestion->getQuestionName() }}
                                    </label>
                                </div>
                            </div>
                        </div>
                        @endforeach
                        @endif
                        <div class="form-group">
                            <div class="col-sm-offset-6 col-sm-6">
                            <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                        </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            function setAverage() {
                var weight = $('#weight').val();
                var count = $('#count').val();
                var nWeight = Number(weight);

                var nCount = Math.floor(Number(count));
                if (nWeight > 0 && String(nCount) === count && nCount >= 0) {
                    var nAverage = (nWeight / nCount).toFixed(2);
                    $('#average').text(nAverage);
                } else {
                    $('#average').text('');
                }
            }

            $('#weight').keyup(function(e) {
                setAverage();
            });
            $('#count').keyup(function(e) {
                setAverage();
            });
            setAverage();
        });
    </script>

    <!-- Average Chart -->
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">Average Weight During the Current Day</div>
                <div class="panel-body">
                     <div id="avg-chart">
                     </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            var jsondata = {!! json_encode($weights) !!};
            console.log(jsondata);
            displayAverageChart(jsondata);
            var avgChart;

            function makeChartData(data) {
                var showData = [];
                for (var i = 0; i < data.length; i++) {
                    var unitData = [];
                    unitData['average'] = (data[i]["total"] / data[i]["count"]).toFixed(2);
                    var d = new Date(data[i]["created_at"]);
                    var hr = d.getHours();
                    var min = d.getMinutes();
                    if (min < 10) {
                        min = "0" + min;
                    }
                    var ampm = hr < 12 ? "am" : "pm";
                    if (hr >= 12) {
                        hr = hr - 12;
                    }
                    if (hr < 10) {
                        hr = "0" + hr;
                    }
                    unitData['time'] = hr + ":" + min + " " + ampm;
                    showData.push(unitData);
                }
                return showData;
            }

            function displayAverageChart(jsondata) {
                var chartData = makeChartData(jsondata);
                if (avgChart == undefined) {
                var serverDataChart = AmCharts.makeChart("avg-chart", {
                    "type": "serial",
                    "dataProvider": chartData,
                    "graphs": [{
                        "balloonText": "[[category]]<br><b>[[average]]</b>",
                        "fillAlphas": 0,
                        "bullet": "round",
                        "bulletSize": 10,
                        "bulletAlpha": 0.3,
                        "liineThinkness": 2,
                        "lineColor": "#0022FF",
                        "type": "line",
                        "valueField": "average"
                    }],
                    "chartCursor": {
                        "categoryBalloonEnabled": false,
                        "cursorAlpha": 0,
                        "zoomable": true
                    },
                    "categoryField": "time",
                    "categoryAxis": {
                        "gridPosition": "start",
                        "labelRotation": 45
                    },
                    "export": {
                        "enabled": true
                    }
                });
                } else {
                    avgChart.dataProvider = chartData; 
                    avgChart.validateData();
                }
            }
        });
        
    </script>

    <!-- Table -->
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">{{ $machine_product_fullname }} (Data from the current day)</div>

                <div class="panel-body">
                     <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Average Weight</th>
                                    <th>Submitted By</th>
                                </tr>
                            </thead>
                            <tbody id="machinetable">
                                @if ($weights != null)
                                @foreach ($weights as $weight)
                                <tr>
                                    <td>{{ $weight->getDate() }}</td>
                                    <td>{{ $weight->getTime() }}</td>
                                    <td>{{ $weight->getAverage() }}</td>
                                    <td>{{ $user_name }} </td>
                                </tr>
                                @endforeach
                                @endif
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection