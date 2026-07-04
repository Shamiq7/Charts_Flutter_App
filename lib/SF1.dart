import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Because Shared Preferences only supports these five data types:

// String
// int
// bool
// double
// List<String>

class Sf1 extends StatefulWidget {
  const Sf1({super.key});

  @override
  State<Sf1> createState() => _Sf1State();
}

class _Sf1State extends State<Sf1> {
  TextEditingController itemcontroller = TextEditingController();
  TextEditingController intcontroller = TextEditingController();
  TextEditingController listcotroller = TextEditingController();
  var nameVal = '';
  var intVal = '';
  var listVal = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              var prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              getValue();
            },
            icon: Icon(Icons.clear_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 300,
                child: TextField(
                  controller: itemcontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter string',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var name = itemcontroller.text.toString();
                    var pref =
                        await SharedPreferences.getInstance(); //opeaned a book and named it pref
                    pref.setString("name", name); //
                    getValue();
                  },
                  child: Text('Save'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    var pref = await SharedPreferences.getInstance();
                    await pref.remove("name");
                    getValue();
                  },
                  child: Text('remove'),
                ),
              ],
            ),

            SizedBox(height: 5),
            Text(nameVal),
            //
            //
            //
            SizedBox(height: 5),
            Container(
              width: 300,
              child: TextField(
                controller: intcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter int',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    int intiger = int.parse(intcontroller.text);
                    var pref = await SharedPreferences.getInstance();
                    pref.setInt("int", intiger);
                    getValue();
                  },
                  child: Text('Save'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    var pref = await SharedPreferences.getInstance();
                    await pref.remove("int");
                    getValue();
                  },
                  child: Text('remove'),
                ),
              ],
            ),

            SizedBox(height: 5),
            Text(intVal),
            //
            //
            //
            SizedBox(height: 5),
            Container(
              width: 300,
              child: TextField(
                controller: listcotroller,
                decoration: InputDecoration(
                  hintText: 'Enter list',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    String list = listcotroller.text;
                    List<String> fruits = list.split(',');
                    var pref = await SharedPreferences.getInstance();
                    pref.setStringList("list", fruits);
                    getValue();
                  },
                  child: Text('Save'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    var pref = await SharedPreferences.getInstance();
                    await pref.remove("list");
                    getValue();
                  },
                  child: Text('remove'),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(listVal),
          ],
        ),
      ),
    );
  }

  //used to initialize shared pref
  void getValue() async {
    var prefs =
        await SharedPreferences.getInstance(); // initialiaze shared pref
    var getName = prefs.getString('name');
    var getint = prefs.getInt(
      'int',
    ); // will see if our key has some value, if yes give it to getName var
    var getList = prefs.getStringList('list');
    nameVal = getName != null ? getName : 'No value saved';

    intVal = getint != null ? getint.toString() : 'no int value';
    listVal = getList?.join(',') ?? 'no  list value saved';
    setState(() {});
  }
}
