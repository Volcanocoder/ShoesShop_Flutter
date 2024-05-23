// ignore_for_file: file_names

class Product{
   final String _productName;
   final int _id;
   final String _price;
   final String _imageUrl;
   final bool _off;
   final String _description;


  Product(this._productName, this._id, this._price, this._imageUrl, this._off,
      this._description);

  String get description => _description;

  bool get off => _off;

  String get imageUrl => _imageUrl;

  String get price => _price;

  int get id => _id;

  String get productName => _productName;


}