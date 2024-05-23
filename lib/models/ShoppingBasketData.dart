// ignore_for_file: file_names, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'Product.dart';

class ShoppingBasketData {
  static ShoppingBasketData? _instance;
  late List<Product> _basketItems;

  ShoppingBasketData._internal() {
    _basketItems = [];
  }

  List<Product> get basketItems => _basketItems;

  set basketItems(List<Product> value) {
    _basketItems = value;
  }

  static ShoppingBasketData getInstance() {
    _instance ??= ShoppingBasketData._internal();
    return _instance!;
  }
}

