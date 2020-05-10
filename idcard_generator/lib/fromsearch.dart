import 'package:flutter/material.dart';

class Searchresult extends StatefulWidget {
  final snapshot;
  Searchresult({this.snapshot});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Searchresult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          widget.snapshot['roll_no'].toString(),
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
