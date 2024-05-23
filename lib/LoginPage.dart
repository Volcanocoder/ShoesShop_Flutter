// ignore_for_file: unused_import, library_private_types_in_public_api, non_constant_identifier_names, sort_child_properties_last, prefer_collection_literals, use_build_context_synchronously, unused_local_variable, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shoesShop/RegisterPage.dart';
import 'ShoppingBasket.dart';
import 'StoreMainMenuPage.dart';
import 'LoginResponseModel.dart';
import 'db/database.dart';
import 'models/base_models.dart';

/*class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginUI(),
    );
  }

  Widget LoginUI() {
    return Builder(
      builder: (context) => Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ورود",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Varela",
                      fontSize: 55,
                      color: Colors.grey[400]),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          hintText: "نام کاربری",
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.perm_identity,
                              color: Colors.grey[500],
                            ),
                          )),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: "Vazir", fontSize: 20),
                      controller: usernameController,
                    ),
                    elevation: 20,
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: Colors.grey[200],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          hintText: "رمز عبور",
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.lock_outline,
                              color: Colors.grey[500],
                            ),
                          )),
                      obscureText: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: "Vazir", fontSize: 20),
                      controller: passwordController,
                    ),
                    elevation: 20,
                    borderRadius: BorderRadius.circular(40),
                    shadowColor: Colors.grey[200],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Material(
                      elevation: 20,
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.red[900],
                      child: InkWell(
                        onTap: () {
                          sendLoginRequest(
                              context: context,
                              username: usernameController.text,
                              password: passwordController.text);
                        },
                        child: const SizedBox(
                          height: 70,
                          child: Center(
                            child: Text(
                              "ورود",
                              style: TextStyle(
                                  fontFamily: "Vazir",
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void sendLoginRequest(
      {required BuildContext context,
      required String username,
      required String password}) async {
    var url="http://welearnacademy.ir/flutter/api/?type=login";

    // var url = "https://pooyapendar.ir/login.json";
    var body = Map<String, dynamic>();
    body["username"] = username;
    body["password"] = password;
    Response response = await post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      //successful
      print("response : $response");
      var loginJson = json.decode(utf8.decode(response.bodyBytes));
      var model = LoginResponseModel(loginJson["result"], loginJson["message"]);
      if (model.result == 0) {
        showMySnackBar(context, model.message);
      } else if (model.result == 1) {
        print("responseeee11111 : $response");

        Navigator.of(context).pushReplacement(PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondAnimation) {
              return const Store();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondAnimation,
                Widget child) {
              return ScaleTransition(
                child: child,
                scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                    parent: animation, curve: Curves.fastOutSlowIn)),
              );
            }));
      }
    } else {
      //error
      showDialog(context: context, builder: (context) {
        return Container(
          width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Text("درخواست با خطا مواجه شد"));
      },);
      // showMySnackBar(context, "درخواست با خطا مواجه شد");
    }
  }

  void showMySnackBar(BuildContext context, String message) {
    Scaffold.of(context).showBottomSheet(SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontFamily: "Vazir",
          fontSize: 15,
        ),
      ),
    ) as WidgetBuilder);
  }
}*/

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  void _login() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      userModel? user = await _databaseHelper.getUser(username, password);
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid username or password'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ورود')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('ورود'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage(),));
              },
              child: Text('ثبت نام'),
            ),
          ],
        ),
      ),
    );
  }
}
