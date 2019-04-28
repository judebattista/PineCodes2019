import 'package:flutter/material.dart';
//adapted from: https://docs.flutter.io/flutter/material/TabController-class.html
//Date Accessed: 4/27/2019

class ChecklistMain extends StatefulWidget {
  const ChecklistMain({ Key key }) : super(key: key);
  @override
  _ChecklistMainState createState() => _ChecklistMainState();
}

class _ChecklistMainState extends State<ChecklistMain> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Tasks'), //Displays all of the User's tasks
    Tab(text : 'Projects'), //Displays all of the User's projects
    Tab(text : 'Classes') //Displays all of the classes the User is currently taking
  ];

  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return Center(child: Text(tab.text));
        }).toList(),
      ),
    );

  }
}