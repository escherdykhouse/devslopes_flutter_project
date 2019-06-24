import 'package:devslopes_course_app/layout.dart';
import 'package:flutter/material.dart';
import 'layout.dart';
import 'secondScreen.dart';
import 'thirdScreen.dart';

void main() => runApp(FlutterApp());

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: HomePage(),
      initialRoute: '/',
      routes: {
        '/pagethree': (context) => ThirdScreen(),
      }
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World Dos"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.beach_access),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            },
          ),
          IconButton(
            icon: Icon(Icons.category),
            onPressed: () {
              Navigator.of(context).pushNamed('/pagethree');
            },
          )
        ],
      ),
      body: LayoutView(),
    );
  }
}
