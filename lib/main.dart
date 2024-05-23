// ignore: duplicate_ignore
// ignore: unused_import
// ignore_for_file: unused_import, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'LoginPage.dart';
import 'ShoppingBasket.dart';


import 'BranchesPage.dart';
import 'DescriptionPage.dart';
import 'Product.dart';
import 'ShopBottomNavigator.dart';
import 'StoreMainMenuPage.dart';

void main() => runApp(MainMaterial());

class MainMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      // home:LoginWidget(),
    );
  }
}