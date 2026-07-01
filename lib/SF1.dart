import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sf1 extends StatefulWidget {
  const Sf1({super.key});

  @override
  State<Sf1> createState() => _Sf1State();
}

class _Sf1State extends State<Sf1> {
  TextEditingController itemcontroller = TextEditingController();
  var nameVal = 'no value saved';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Preference'), centerTitle: true),
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
                    hintText: 'Enter Text',
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
            ElevatedButton(
              onPressed: () async {
                var name = itemcontroller.text.toString();
                var pref = await SharedPreferences.getInstance();
                pref.setString("name", name);
              },
              child: Text('Save'),
            ),
            SizedBox(height: 5),
            Text(nameVal),
          ],
        ),
      ),
    );
  }

  //used to initialize shared pref
  void getValue() async {
    var prefs =
        await SharedPreferences.getInstance(); // initialiaze shared pref
    var getName = prefs.getString(
      'name',
    ); // will see if our key has some value, if yes give it to getName var
    nameVal = getName != null ? getName : 'No value saved';
    setState(() {});
  }
}
