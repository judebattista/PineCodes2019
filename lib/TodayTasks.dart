import 'package:flutter/material.dart';


class TodayTasks extends StatefulWidget{
  @override
  _TodayTasksState createState() => _TodayTasksState();

}

class _TodayTasksState extends State<TodayTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today's Tasks"),
      ),
      body: Center(
      ),
      bottomNavigationBar : BottomAppBar()
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}