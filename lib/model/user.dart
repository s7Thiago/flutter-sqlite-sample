class User {
  int _id;
  String _name;
  String _password;

  // getters
  int get id => _id;
  String get password => _password;
  String get name => _name;

  User(this._name, this._password);

  //
  User.map(dynamic obj) {
    this._name = obj['name'];
    this._password = obj['password'];
    this._id = obj['id'];
  }

  User.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._password = map['password'];
  }

  Map<String, dynamic> toMap() {
    var innerMap = Map<String, dynamic>();

    if (_id != null) innerMap['id'] = _id;
    innerMap['name'] = _name;
    innerMap['password'] = _password;

    return innerMap;
  }
}
