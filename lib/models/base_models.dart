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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile'] = this.mobile;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;

    return data;
  }
}