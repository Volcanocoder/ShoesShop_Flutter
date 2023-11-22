// ignore: duplicate_ignore
// ignore: unused_import
// ignore_for_file: unused_import, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sample/StoreMainMenuPage.dart';
import 'package:http/http.dart';
import 'LoginPage.dart';
import 'ShoppingBasket.dart';


import 'BranchesPage.dart';
import 'DescriptionPage.dart';
import 'Product.dart';
import 'ShopBottomNavigator.dart';

void main() => runApp(MainMaterial());

class MainMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Store(),
      // home:LoginWidget(),
    );
  }
}