import 'package:flutter/material.dart';
import 'package:graphs_app_flutter/graph1.dart';
import 'package:graphs_app_flutter/graph2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Graph2());
  }
}
