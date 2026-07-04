import 'package:flutter/material.dart';
import 'package:graphs_app_flutter/SF1.dart';
import 'package:graphs_app_flutter/graph2.dart';
import 'package:graphs_app_flutter/hivedb.dart';
import 'package:graphs_app_flutter/model.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // this tells flutter "Finish preparing everything before I start using plugins.", so tht before we use hive or any plugin flutter itself is ready
  await Hive.initFlutter();
  Hive.registerAdapter(DataAdapter());
  await Hive.openBox<Data>('Key'); // why do this here?
  //   This means:
  // App Starts
  //      │
  //      ▼
  // Open UserBox
  //      │
  //      ▼
  // App launches
  // Now every screen can immediately use:
  // var box = Hive.box("UserBox");
  // Think of it like unlocking your house's main door once in the morning
  // instead of unlocking it every time you enter a room.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Hivedb());
  }
}
