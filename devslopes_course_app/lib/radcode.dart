import 'package:flutter/material.dart';
import 'posts_list.dart';

class RadCodePage extends StatefulWidget {
  @override
  _RadCodePageState createState() => _RadCodePageState();
}

class _RadCodePageState extends State<RadCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RadCode"),
      ),
      body: PostsList(),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 44),
          color: Colors.white,
          child: Text("Test"),
        ),
      ),
    );
  }
}
