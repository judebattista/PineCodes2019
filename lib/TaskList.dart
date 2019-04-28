import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class TaskListState extends State<TaskList> {
  final _biggerFont = const TextStyle(fontSize: 18.0);


  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          return _buildRow(index);
        });
  }
  // #enddocregion _buildSuggestions

  // #docregion _buildRow
  Widget _buildRow(final index) {
    return ListTile(
      title: Text(
        'Task $index',
      ),
    );
  }
  // #enddocregion _buildRow

  // #docregion RWS-build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSuggestions(),
    );
  }
// #enddocregion RWS-build
// #docregion RWS-var
}
// #enddocregion RWS-var


class TaskList extends StatefulWidget {
  @override
  TaskListState createState() => TaskListState();
}
