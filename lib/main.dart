import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _name = "Piyush";

  _editName(BuildContext context) async {
    var name = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditPage()));

    setState(() {
      _name = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Basic App"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(_name),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {
                  _editName(context);
                },
                child: Text("Edit"),
                elevation: 5,
                textColor: Colors.white,
                color: Colors.blue,
              ),
            )
          ],
        ));
  }
}

class EditPage extends StatelessWidget {
  final input = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit your name'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
                child: Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: input,
              ),
            )),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, input.text);
                },
                child: Text('Save'),
              ))
        ],
      ),
    );
  }
}