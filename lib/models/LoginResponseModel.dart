// ignore_for_file: file_names, unnecessary_getters_setters

class LoginResponseModel{
  int _result;
  String _message;


  LoginResponseModel(this._result, this._message);

  int get result => _result;

  set result(int value) {
    _result = value;
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }


}