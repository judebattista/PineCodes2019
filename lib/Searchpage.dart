import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key:key);
  @override
  SearchPageState createState() => SearchPageState();
}

//https://medium.com/flutterpub/a-simple-search-bar-in-flutter-f99aed68f523 tutorial on a search bar (accessed 4/28/19)
//https://www.developerlibs.com/2018/06/flutter-apply-search-box-in-appbar.html
//Full example code: https://github.com/ahmed-alzahrani/Flutter_Search_Example/blob/master/lib/main.dart
class SearchPageState extends State<SearchPage> {
  //from medium tutorial: setting up searchPage state
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search...' );

  //Default constructor for page will check for entered text
  //If text is in the search bar, it will set the text in the search bar to the current search text so we can filter firebase content
  SearchPageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }


  @override
  void initState() {
    //this._getNames(); //TODO: replace with firebase searching thing
    super.initState();
  }

  //Builds widgets controller
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : _buildBar( context), //builds search bar
      body: Container (
        child: _buildList(), //
        ),
      resizeToAvoidBottomPadding: false,
    );
  }

  //Builds search bar initially
  //Adapted from https://github.com/ahmed-alzahrani/Flutter_Search_Example/blob/master/lib/main.dart
  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(icon: _searchIcon, onPressed: _searchPressed,)
    );
  }

  //if the button is pressed, take away search icon and allow text entry now
  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close); //remove search icon
        this._appBarTitle = new TextField(
          controller: _filter,
            decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
                hintText: 'Type Search...'
            ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search');
        //filteredNames = names; TODO: Filtered firebase content goes here
        //TODO: Make firebase searching function
        _filter.clear();
      }
    });
  }

  //Builds search list
  //Displays list as list of widget bars (will have data fields for us)
  Widget _buildList() {
    if (!(_searchText.isEmpty)) {

    }
  }

}
