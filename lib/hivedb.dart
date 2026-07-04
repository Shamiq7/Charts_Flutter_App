import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
  TextEditingController fieldcontroller = TextEditingController();
  String namevalue = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openhive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hive Database'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 300,
              child: TextField(
                controller: fieldcontroller,
                decoration: InputDecoration(
                  hintText: 'Write something',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 1.5,
                      style: BorderStyle.solid,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 1.5,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  var item = fieldcontroller.text.toString();
                  var box = Hive.box('Key');
                  box.put('keyname', item);
                },
                child: Text('Save'),
              ),
              ElevatedButton(
                onPressed: () {
                  var boxes = Hive.box('Key');
                  var name = boxes.get(
                    'keyname',
                    defaultValue: 'No value found',
                  );
                  setState(() {
                    namevalue = name;
                  });
                },
                child: Text('Load'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(namevalue),
        ],
      ),
    );
  }

  void openhive() {}
}
