import 'package:flutter/material.dart';
import 'package:youtube_crypto/screens/home/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff180338),
        appBar: AppBar(
          title: Text(
            "Youtube Tracker",
            style: TextStyle(
              fontSize: 28.0,
              color: Color(0xff07f2a0),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          brightness: Brightness.dark,
        ),
        body: Body());
  }
}
