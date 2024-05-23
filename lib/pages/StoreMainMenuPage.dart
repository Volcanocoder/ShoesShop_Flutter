// ignore_for_file: file_names, unused_import, library_private_types_in_public_api, prefer_final_fields, sized_box_for_whitespace, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'LoginPage.dart';
import 'ShoppingBasket.dart';

import 'BranchesPage.dart';
import 'DescriptionPage.dart';
import '../models/Product.dart';
import '../widgets/ShopBottomNavigator.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  List<Product> _items = [];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "فروشگاه",
          style: TextStyle(color: Colors.black45, fontFamily: "Vazir"),
        ),
        centerTitle: true,

        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.map,
              color: Colors.black45,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BranchesPage()));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_basket,
              color: Colors.black45,
            ),
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return ShoppingBasket();
                },
              ));
              /*Navigator.of(context).push(PageRouteBuilder(
                  transitionDuration: const Duration(seconds: 1),
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondAnimation) {
                    return const ShoppingBasket();
                  },
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondAnimation,
                      Widget child) {
                    return SlideTransition(
                      child: child,
                      position:
                      Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                          .animate(CurvedAnimation(
                          parent: animation,
                          curve: Curves.fastOutSlowIn)),
                    );
                  }));*/
            },
          )
        ],
      ),
     /* body: ListView.builder(itemBuilder: (context, index) {
        return generateItem(_items[index], context);
      },),*/
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 15,
          children: List.generate(_items.length, (int position) {
            return generateItem(_items[position], context);
            // return Text(_items[position].productName);
          }),
        ),
      ),
      bottomNavigationBar: const ShopBottomNagiv(),

    );
  }

  void fetchItems() async {
    var url = "https://pooyapendar.ir/product.json";
    Response response = await get(Uri.parse(url));
    setState(() {
      var productJson = json.decode(utf8.decode(response.bodyBytes));
      for (var i in productJson) {
        var productItem = Product(i['product_name'], i['id'], i['price'].toString(),
            i['image_url'], i['off'], i['description']);
        _items.add(productItem);
        print(productItem);
      }
    });
  }
}

Card generateItem(Product product, context) {
  return Card(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    elevation: 4,
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DescriptionPage(product)));
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 130,
              height: 110,
              child: Image.network(product.imageUrl),
            ),

            Text(
              product.productName,
              style: const TextStyle(
                  fontFamily: "Vazir",
                  color: Color(0xFF575E67),
                  fontSize: 14.0),
            ),
            Text(
              product.price + " تومان ",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontFamily: "Vazir", color: Colors.red[700], fontSize: 16.0),
            ),
          ],
        ),
      ),
    ),
  );
}
