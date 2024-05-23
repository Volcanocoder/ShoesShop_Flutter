// ignore: duplicate_ignore
// ignore: unused_import
// ignore_for_file: unused_import, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'pages/LoginPage.dart';
import 'pages/ShoppingBasket.dart';
import 'models/Product.dart';
import 'widgets/ShopBottomNavigator.dart';
import 'pages/StoreMainMenuPage.dart';

void main() => runApp(MainMaterial());

class MainMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      home: LoginPage(),
      // home:LoginWidget(),
    );
  }
}