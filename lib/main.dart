import 'package:flutter/material.dart';
//import 'TodayTasks.dart';
//import 'CreateTasks.dart';
import 'package:flutter/services.dart';
import 'PageHome.dart';

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
          primarySwatch: Colors.indigo,
          accentColor: Colors.deepPurple[500],
          canvasColor: Colors.teal[200],
        ),
        home: MyHomePage(title: 'College RPG home'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavBarIndex = 0;
  PageHome pageHome; //home screen
  currentPage = pageHome;
  List<Widget> pageList;
  Widget currentPage;

  @override
  void initState() {
    //create pages in app
    pageHome = PageHome(); //home screen

    pageList = [];
    super.initState();
  }

  void callback() {
    setState(() {});
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _bottomNavBarIndex,
          onTap: (int index) {
            setState(() {
              _bottomNavBarIndex = index;

              //Temp page selector

              currentPage = pageList[index];
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
          ]),
    );
  }
}
