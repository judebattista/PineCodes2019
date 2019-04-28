import 'package:flutter/material.dart';
//import 'TodayTasks.dart';
//import 'CreateTasks.dart';
import 'package:flutter/services.dart';
//import 'PageHome.dart';

void main() => runApp(ChinchillaChecklist());

class ChinchillaChecklist extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
        title: 'Chinchilla Checklist',
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.deepPurple,
          canvasColor: Colors.lightBlueAccent[50],
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //CreateTasks createTasks;
  //TodayTasks todayTasks;
  //PageHome pageHome;

  List<Widget> pageList;
  Widget currentPage;

  @override
  void initState(){

    //createTasks = CreateTasks();
    //todayTasks = TodayTasks();
    //pageHome = PageHome();

    pageList = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
