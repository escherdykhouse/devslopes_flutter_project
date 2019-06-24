import 'package:devslopes_course_app/layout.dart';
import 'package:flutter/material.dart';
import 'layout.dart';

void main() => runApp(FlutterApp());

class FlutterApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello World Dos"),
          actions: <Widget>[IconButton(icon: Icon(Icons.beach_access),onPressed: () {

          },)],
        ),
        body: LayoutView(),
      ),
    );
  }
}

