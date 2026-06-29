import 'package:flutter/widgets.dart';

class SalesData {
  final int year;
  final double sales;
  final Color color;

  SalesData({required this.color, required this.sales, required this.year});
}

class PieData {
  final num ydata;
  final String xdata;
  PieData({required this.xdata, required this.ydata});
}
