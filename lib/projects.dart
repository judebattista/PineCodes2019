//import 'package:cloud_firestore/cloud_firestore.dart';


class Projects {
  String _projectName;
  DateTime _finalDueDate;
  List<String> _taskKeys; //keys of tasks which are added to the project
  String _className;
  int _completedTasks;
  int _currentTasks;


  Projects(this._projectName, this._finalDueDate, this._taskKeys, this._className);

  //get methods to access private variables
  String get name => _projectName;
  DateTime get finalDueDate => _finalDueDate;
  List<String> get taskKeys => _taskKeys;
  String get className => _className;
  int get completedTasks => _completedTasks;
  int get currentTasks => _currentTasks;


  //creates history object mapping
  Projects.map(dynamic obj) {
    this._projectName = obj['projectName'];
    this._finalDueDate = obj['finalDueDate'];
    this._taskKeys = obj['taskKeys'];
    this._className = obj['className'];
    this._completedTasks = obj['completedTasks'];
    this._currentTasks = obj['currentTasks'];
  }

  //creates a map from a history object
  static Map<String, dynamic> toMap(Projects p) {
    var map = new Map<String, dynamic>();
    map['projectName'] = p._projectName;
    map['finalDueDate'] = p._finalDueDate;
    map['taskKeys'] = p._taskKeys;
    map['className'] = p._className;
    map['completedTasks'] = p._completedTasks;
    map['currentTasks'] = p._currentTasks;
    return map;
  }

  //creates a history object from a map (how history objects will be created from those stored on firebase already)
  Projects.fromMap(Map<String, dynamic> map) {
    this._projectName = map['projectName'];
    this._finalDueDate = map['finalDueDate'];
    this._taskKeys = map['taskKeys'];
    this._className = map['className'];
    this._completedTasks = map['completedTasks'];
    this._currentTasks = map['currentTasks'];
  }
}