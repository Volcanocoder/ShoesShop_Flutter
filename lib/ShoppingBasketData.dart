// ignore_for_file: file_names, unused_local_variable, no_leading_underscores_for_local_identifiers



import 'Product.dart';


class ShoppingBasketData {
  static ShoppingBasketData _instance=_instance;
  late List<Product>_basketItems;

     ShoppingBasketData(){
      List<Product>_basketItems;
    
  }

  // ignore: unnecessary_getters_setters
  List<Product> get basketItems => _basketItems;

  set basketItems(List<Product> value) {
    _basketItems = value;
  }

  static ShoppingBasketData getInstance() {
    // ignore: prefer_conditional_assignment, unnecessary_null_comparison
    if (_instance == null) {
      _instance = ShoppingBasketData();
    }

    return _instance;
  }
}
