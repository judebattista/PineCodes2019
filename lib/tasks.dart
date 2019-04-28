//import 'package:cloud_firestore/cloud_firestore.dart';


class Tasks {
  String _id;
  String _name;
  DateTime _dueDate;
  double _timeEstimate;
  double _timeCompleted;
  String _semester;
  int _year;
  String _className;
  String _projectName;


  Tasks(this._id, this._name, this._dueDate, this._timeEstimate, this._timeCompleted, this._semester, this._year, this._className, this._projectName);

  //get methods to access private variables
  String get id => _id;
  String get name => _name;
  DateTime get dueDate => _dueDate;
  double get timeEstimate => _timeEstimate;
  double get timeCompleted => _timeCompleted;
  int get timeCheckedOut => _year;
  String get semester => _semester;
  String get className => _className;
  String get projectName => _projectName;

  //creates history object mapping
  Tasks.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._dueDate = obj['dueDate'];
    this._timeEstimate = obj['timeEstimate'];
    this._timeCompleted = obj['timeCompleted'];
    this._semester = obj['semester'];
    this._year= obj['year'];
    this._className = obj['className'];
    this._projectName = obj["projectName"];
  }

  //creates a map from a history object
  static Map<String, dynamic> toMap(Tasks t) {
    var map = new Map<String, dynamic>();
    map['id'] = t._id;
    map['name'] = t._name;
    map['dueDate'] = t._dueDate;
    map['timeEstimate'] = t._timeEstimate;
    map['timeCompleted'] = t._timeCompleted;
    map['semester'] = t._semester;
    map['year'] = t._year;
    map['className'] = t._className;
    map['projectName'] = t._projectName;
    return map;
  }

  //creates a history object from a map (how history objects will be created from those stored on firebase already)
  Tasks.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._dueDate = map['dueDate'];
    this._timeEstimate = map['timeEstimate'];
    this._timeCompleted = map['timeCompleted'];
    this._semester = map['semester'];
    this._year = map['year'];
    this._className = map['className'];
    this._projectName = map['projectName'];
  }
}