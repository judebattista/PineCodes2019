import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key:key);
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('College RPG PageHome'),
      ),
    );

  }
}
