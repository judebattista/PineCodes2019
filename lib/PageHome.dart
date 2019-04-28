import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  PageHome({Key key}) : super(key:key);
  @override
  PageHomeState createState() => PageHomeState();
}

class PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('College RPG PageHome'),
      ),
      );

  }
}
