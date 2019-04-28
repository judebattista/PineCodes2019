import 'package:flutter/material.dart';
import 'TaskList.dart';
import 'ProjectList.dart';
import 'ClassList.dart';
import 'dart:io';
//adapted from: https://docs.flutter.io/flutter/material/TabController-class.html
//Date Accessed: 4/27/2019

class ChecklistMain extends StatefulWidget {
  const ChecklistMain({Key key}) : super(key: key);
  @override
  _ChecklistMainState createState() => _ChecklistMainState();
}

//Tab controller adapted from: https://kodestat.gitbook.io/flutter/flutter-tab-navigation (4/27/19)
class _ChecklistMainState extends State<ChecklistMain> with SingleTickerProviderStateMixin {
  //Navigation tabs
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Tasks'), //Displays all of the User's tasks
    Tab(text: 'Projects'), //Displays all of the User's projects
    Tab(text: 'Classes') //Displays all of the classes the User is currently taking
  ];

  List<Widget> pageList;
  Widget currentPage;
  TabController _tabController;
  TaskList taskList;
  ProjectList projectList;
  ClassList classList;

  @override
  void initState() {
    taskList = TaskList();
    projectList = ProjectList();
    classList = ClassList();
    currentPage = TaskList();
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _searchQuery = new TextEditingController();
    pageList = [taskList, projectList, classList];
  }

  //For tab controller
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();

  TextEditingController _searchQuery;
  bool _isSearching = false;
  String searchQuery = "Search query";

//this is used to search things in the appBar
  //adapted from: https://www.developerlibs.com/2018/06/flutter-apply-search-box-in-appbar.html
  //date accessed: 4/27/2019
  void _startSearch() {
    print("open search box");
    ModalRoute.of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    print("close search box");
    setState(() {
      _searchQuery.clear();
      updateSearchQuery("Search query");
    });
  }

  Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment =
        Platform.isIOS ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return new InkWell(
      onTap: () => scaffoldKey.currentState.openDrawer(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: <Widget>[
            const Text('Seach box'),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return new TextField(
      controller: _searchQuery,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: updateSearchQuery,
    );
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
    print("search query " + newQuery);
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        new IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQuery == null || _searchQuery.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      new IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  //building body (middle screen) viewing of lists if a search term has been entered or if it has not been entered
  //We want body for each widget types to be similar to this medium example: https://medium.com/flutter-community/breaking-layouts-in-rows-and-columns-in-flutter-8ea1ce4c1316
  
  Widget _buildTasksBody() {
    //we want a list of bars with tasks names with due date and etc. in there if there is a searchQuery phrase
    if (searchQuery == "Search query") {
      //this is the default message
      //just display centered app name
      return Container(
        child: Center (
          child: Text("CollegeRPG")
        )
      );
    } else {
      //search has been entered
      //update to list of relevant items, needs a listener???

    }
  }

  Widget _buildProjectsBody() {
    if (searchQuery == "Search query") {
      return Container(
        child: Center(
          child: Text("CollegeRPG")
        )
      );
    } else {

    }
  }

  Widget _buildClassesBody() {}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching ? const BackButton() : null,
        title: _isSearching ? _buildSearchField() : _buildTitle(context),
        actions: _buildActions(),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs, //tabs for top search portion
        ),
      ),

      //Fix #2: (better) https://kodestat.gitbook.io/flutter/flutter-tab-navigation
      //Hooks the body for the tabs to new widgets we can generate the search from
      //If no search query defined, we can just display app name???
      body: TabBarView(
        controller: _tabController,
        //type: BottomNavigationBar.fixed,
        children: <Widget> [
          _buildTasksBody(), //tasks
          _buildProjectsBody(), //projects
          _buildClassesBody(), //classes
        ],
      ),
        /*myTabs: <Tabs>(
            type: BottomNavigationBarType.fixed,
            currentIndex: _bottomNavBarIndex,
            onTap: (int index) {
              setState(() {
                _bottomNavBarIndex = index;

                //Temp page selector

                currentPage = pageList[index];
              });
            },
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return Center(child: Text(tab.text));
        }).toList(),
      ),
      */
    );
  }
}
