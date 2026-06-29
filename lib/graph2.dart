//PIE CHART

import 'package:flutter/material.dart';
import 'package:graphs_app_flutter/model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph2 extends StatefulWidget {
  const Graph2({super.key});

  @override
  State<Graph2> createState() => _Graph2State();
}

class _Graph2State extends State<Graph2> {
  List<PieData> charData = [
    PieData(xdata: 'SK', ydata: 90000),
    PieData(xdata: 'MK', ydata: 3000),
    PieData(xdata: 'LK', ydata: 50000),
    PieData(xdata: 'YK', ydata: 27000),
    PieData(xdata: 'PK', ydata: 10000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PIE CHART'), centerTitle: true),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Center(
              child: SfCircularChart(
                series: [
                  PieSeries<PieData, String>(
                    dataSource: charData,
                    xValueMapper: (PieData data, _) => data.xdata,
                    yValueMapper: (PieData data, _) => data.ydata,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
