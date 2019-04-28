//import 'package:cloud_firestore/cloud_firestore.dart';


class Classes {
  String _id;
  String _className;
  DateTime _endDate;
  DateTime _startDate;
  List<String> _taskKeys; //keys of tasks which are added to the project
  List<String> _projectKeys;
  int _completedTasks;
  int _currentTasks;


  Classes(this._id, this._className, this._endDate, this._startDate, this._taskKeys, this._projectKeys, this._completedTasks, this._currentTasks);

  //get methods to access private variables
  String get id => _id;
  String get className => _className;
  DateTime get endDate => _endDate;
  DateTime get startDate => _startDate;
  List<String> get taskKeys => _taskKeys;
  List<String> get projectKeys => _projectKeys;
  int get completedTasks => _completedTasks;
  int get currentTasks => _currentTasks;


  //creates history object mapping
  Classes.map(dynamic obj) {
    this._id = obj['id'];
    this._className = obj['className'];
    this._endDate = obj['endDate'];
    this._startDate = obj['startDate'];
    this._taskKeys = obj['taskKeys'];
    this._projectKeys = obj['objectKeys'];
    this._completedTasks = obj['completedTasks'];
    this._currentTasks = obj['currentTasks'];
  }

  //creates a map from a history object
  static Map<String, dynamic> toMap(Classes c) {
    var map = new Map<String, dynamic>();
    map['id'] = c._id;
    map['className'] = c._className;
    map['endDate'] = c._endDate;
    map['startDate'] = c._startDate;
    map['taskKeys'] = c._taskKeys;
    map['projectKeys'] = c._projectKeys;
    map['completedTasks'] = c._completedTasks;
    map['currentTasks'] = c._currentTasks;
    return map;
  }

  //creates a history object from a map (how history objects will be created from those stored on firebase already)
  Classes.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._className = map['className'];
    this._endDate = map['endDate'];
    this._startDate = map['startDate'];
    this._taskKeys = map['taskKeys'];
    this._projectKeys = map['projectKeys'];
    this._completedTasks = map['completedTasks'];
    this._currentTasks = map['currentTasks'];
  }
}