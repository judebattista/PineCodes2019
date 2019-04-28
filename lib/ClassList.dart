import 'package:flutter/material.dart';

class ClassList extends StatefulWidget {
  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('College RPG - Class List'),
      ),
    );
  }
}