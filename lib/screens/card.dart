import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCard extends StatefulWidget {
  String content;
  MyCard({this.content = " - "});
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.teal[800],
      ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
            child: Text(
          widget.content,
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
      ),
    );
  }
}
