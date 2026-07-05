import 'package:flutter/material.dart';
import 'package:graphs_app_flutter/model.dart';
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
  final Keyvalue = 'Key';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openhive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Database'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              var box = Hive.box(Keyvalue);
              box.clear();
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
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
                  Data item = Data(
                    age: 21,
                    name: fieldcontroller.text,
                    surname: 'max',
                  );

                  // var box = Hive.box(Keyvalue);
                  Box<Data> box = Hive.box<Data>(Keyvalue);
                  box.put('keyname', item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text('Item Saved'),
                    ),
                  );
                  setState(() {});
                },
                child: Text('Save'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // var boxes = Hive.box(Keyvalue);
                  Box<Data> boxes = Hive.box<Data>(Keyvalue);
                  // var name = boxes.get(
                  //   'keyname',
                  //   defaultValue: 'No value found',
                  // );
                  Data? person = boxes.get('keyname');
                  if (person != null) {
                    setState(() {
                      namevalue =
                          '${person.name} ${person.surname} ${person.age} ';
                    });
                  } else {
                    namevalue = 'Value not found';
                    setState(() {});
                  }
                },
                child: Text('Load'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // var boxes = Hive.box(Keyvalue);
                  Box<Data> boxes = Hive.box<Data>(Keyvalue);
                  // var name = boxes.get(
                  //   'keyname',
                  //   defaultValue: 'No value found',
                  // );
                  boxes.delete('keyname');
                  setState(() {
                    namevalue = 'value deleted';
                  });
                },
                child: Text('Delete'),
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
