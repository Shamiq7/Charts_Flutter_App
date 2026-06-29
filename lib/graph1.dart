import 'package:flutter/material.dart';
import 'package:graphs_app_flutter/model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph1 extends StatefulWidget {
  const Graph1({super.key});

  @override
  State<Graph1> createState() => _Graph1State();
}

//Line Series
//Bar Series
//Spline Series
//Area
//Colum Series
//WaterFall Series,         we can make all these diffrent types of charts using the same code below

class _Graph1State extends State<Graph1> {
  final List<SalesData> chartData = [
    SalesData(color: Colors.green, sales: 34000, year: 2001),
    SalesData(color: Colors.green, sales: 44000, year: 2002),
    SalesData(color: Colors.red, sales: 42000, year: 2003),
    SalesData(color: Colors.green, sales: 49000, year: 2004),
    SalesData(color: Colors.green, sales: 120000, year: 2005),
    SalesData(color: Colors.green, sales: 34000, year: 2006),
    SalesData(color: Colors.green, sales: 44000, year: 2007),
    SalesData(color: Colors.red, sales: 42000, year: 2008),
    SalesData(color: Colors.green, sales: 49000, year: 2009),
    SalesData(color: Colors.green, sales: 120000, year: 2010),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget 1'), centerTitle: true),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              //
              child: SfCartesianChart(
                legend: Legend(isVisible: true, isResponsive: true),
                title: ChartTitle(text: 'Sales Data'),
                series: [
                  ColumnSeries<SalesData, int>(
                    // dataSource: [],
                    // color: Colors.green,
                    dashArray: <double>[5, 10],
                    pointColorMapper: (SalesData sales, _) => sales.color,
                    legendItemText: 'Sales',
                    dataSource: chartData,
                    //used to show x - axis
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
