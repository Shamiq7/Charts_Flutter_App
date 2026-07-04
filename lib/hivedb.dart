import 'package:flutter/material.dart';
// \
// App Starts
//       │
//       ▼
// Initialize Hive
//       │
//       ▼
// Open a Box
//       │
//       ▼
// Read / Write Data
//       │
//       ▼
// Close App

class Hivedb extends StatefulWidget {
  const Hivedb({super.key});

  @override
  State<Hivedb> createState() => _HivedbState();
}

class _HivedbState extends State<Hivedb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Database'),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}