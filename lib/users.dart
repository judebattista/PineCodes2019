//https://www.developerlibs.com/2018/10/flutter-login-registration-authentication-firebase.html

class Users {
  String _name;
  //AVATAR//https://www.monstertechnocodes.com/2019/01/storing-user-data-like-name-image-to.html (tutorial for storing image data)
  int _currentYear;
  String _currentSemester;
  DateTime _currentSemesterEndDate;
  String _email;
  String _password;
  int _lifetimeCoins;
  int _currentCoins;

  Users(this._name, this._currentYear, this._currentSemester, this._currentSemesterEndDate, this._email, this._password, this._lifetimeCoins, this._currentCoins);

  String get name => _name;
  int get currentYear =>_currentYear;
  String get currentSemester => _currentSemester;
  DateTime get currentSemesterEndDate =>_currentSemesterEndDate;
  String get email => _email;
  String get password => password;
  int get lifetimeCoins => _lifetimeCoins;
  int get currentCoins => _currentCoins;

  Users.map(dynamic obj) {
    this._name = obj['name'];
    this._currentYear = obj['currentYear'];
    this._currentSemester = obj['currentSemester'];
    this._currentSemesterEndDate = obj['currentSemesterEndDate'];
    this._email = obj['email'];
    this._password = obj['password'];
    this._lifetimeCoins = obj['lifetimeCoins'];
    this._currentCoins = obj['currentCoins'];
  }

  static Map<String, dynamic> toMap(Users u) {
    var map = new Map<String, dynamic>();
    map['name'] = u._name;
    map['currentYear'] = u._currentYear;
    map['currentSemester'] = u._currentSemester;
    map['email'] = u._email;
    map['password'] = u._password;
    map['lifetimeCoins'] = u._lifetimeCoins;
    map['currentCoins'] = u._currentCoins;
    return map;
  }

  Users.fromMap(Map<String, dynamic> map) {
    this._name = map['name'];
    this._currentYear = map['currentYear'];
    this._currentSemester = map['currentSemester'];
    this._email = map['email'];
    this._password = map['password'];
    this._lifetimeCoins = map['lifetimeCoins'];
    this._currentCoins = map['currentCoins'];
  }


}