import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

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

@HiveType(typeId: 0)
class Data {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  @HiveField(2)
  String surname;

  Data({required this.age, required this.name, required this.surname});
}
