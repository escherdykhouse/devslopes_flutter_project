import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: Center(
        child: RaisedButton(
          child: Text("Go Back"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      )
    );
  }
}