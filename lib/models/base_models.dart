class login {
  login({
    required this.id,
    required this.username,
    required this.password,
  });

  String id;
  String username;
  String password;
}
class userModel {
  final int? id;
  final String email;
  final String password;
  final String? fullName;
  final String? mobile;

  userModel({
    this.id,
    required this.email,
    required this.password,
    this.fullName,
    this.mobile,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'fullName': fullName,
      'mobile': mobile,
    };
  }

  factory userModel.fromMap(Map<String, dynamic> map) {
    return userModel(
      id: map['id'],
      email: map['email'],
      password: map['password'],
      fullName: map['fullName'],
      mobile: map['mobile'],
    );
  }
}
/*

class userModel {
  String? id;
  String? mobile;
  String? email;
  String? fullName;
  String? password;


  userModel({this.id, this.mobile, this.email, this.fullName, this.password});

  userModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobile = json['mobile'];
    email = json['email'];
    fullName = json['fullName'];
    password = json['password'];
  }
  factory userModel.fromMap(Map<String, dynamic> map) {
    return userModel(
      id: map['id'] ,
      email: map['email'] as String,
      password: map['password'] as String,
      fullName: map['fullName'] as String?,
      mobile: map['mobile'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'fullName': fullName,
      'mobile': password,
    };

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile'] = this.mobile;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;

    return data;
  }
}*/
