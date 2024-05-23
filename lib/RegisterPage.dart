import 'dart:math';

import 'package:flutter/material.dart';
import 'db/database.dart';
import 'models/base_models.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _mobileController = TextEditingController();
  var random = Random.secure();

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  void _register() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    final String mobile = _mobileController.text;
    final String email = _emailController.text;
    final String fullName = _fullNameController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      userModel user = userModel(
          email: email,
          password: password,
          id: random.nextInt(800000).toString(),
          fullName: fullName,
          mobile: mobile);
      await _databaseHelper.insertUser(user);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ثبت نام')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: ' Email'),
            ),
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: _mobileController,
              decoration: InputDecoration(labelText: 'Mobile'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text('تایید'),
            ),
          ],
        ),
      ),
    );
  }
}
