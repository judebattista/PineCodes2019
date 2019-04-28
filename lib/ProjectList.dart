import 'package:flutter/material.dart';

class ProjectList extends StatefulWidget {
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('College RPG - Project List'),
      ),
    );
  }
}