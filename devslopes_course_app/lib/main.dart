import 'package:flutter/material.dart';

void main() => runApp(FlutterApp());

class FlutterApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: HomePage(title: "This is my App"),
    );
  }
}

class HomePage extends StatefulWidget {

  //Variables in this class can be passed in from parents
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Variables in this class are only used in child elements
  var color = Colors.white;

  //Toggles the color (above) between green and white.
  void _changeColor() {
    setState(() {
     color = color == Colors.white ? Colors.green : Colors.white; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello Flutter",
              style: TextStyle(
                fontSize: 17,
                color: this.color
              )
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeColor,
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}