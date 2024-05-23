// ignore_for_file: file_names

class Branch{
  final String _name;
  final int _id;
  final String _tel;
  final double _lat;
  final double _lng;
  final String _manager;

  Branch(this._name, this._id, this._tel, this._lat, this._lng, this._manager);

  String get manager => _manager;

  double get lng => _lng;

  double get lat => _lat;

  String get tel => _tel;

  int get id => _id;

  String get name => _name;


}