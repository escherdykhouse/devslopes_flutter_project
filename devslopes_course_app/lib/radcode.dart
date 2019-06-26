import 'package:flutter/material.dart';
import 'posts_list.dart';

import 'dart:async';
import 'package:flutter/services.dart';

class RadCodePage extends StatefulWidget {
  @override
  _RadCodePageState createState() => _RadCodePageState();
}

class _RadCodePageState extends State<RadCodePage> {

  String _ipAddress = 'unknown';

  Future<void> _getIpAddress() async {
    String ipAddress;

  try {
    const platform = const MethodChannel('pupbook.native/');
    final String result = await platform.invokeMethod('getIpAddress');
    ipAddress = "Your IP Address is: $result";
  } on PlatformException catch (e) {
    ipAddress = "A native issue occurred\n${e.message}";
  } catch (e) {
    ipAddress = "A flutter issue occurred\n${e.message}";
  }

    setState(() {
     _ipAddress = ipAddress; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PuppyBook"),
      ),
      backgroundColor: Colors.grey[300],
      body: PostsList(),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 44),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Text(_ipAddress),
              FlatButton(
                child: Icon(Icons.refresh),
                onPressed: () {
                  _getIpAddress();
                },
              )
            ],
          )
        ),
      ),
    );
  }
}
