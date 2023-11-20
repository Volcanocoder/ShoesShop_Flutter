// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'Product.dart';
import 'ShoppingBasketData.dart';

// ignore: must_be_immutable
class DescriptionPage extends StatelessWidget {
  final Product _product;
   const DescriptionPage(this._product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "فروشگاه",
          style: TextStyle(color: Colors.black45, fontFamily: "Vazir"),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black45,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Builder(
        builder:(context)=> Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Shoes",
                  style: TextStyle(
                      fontFamily: "Varela", color: Colors.red[700], fontSize: 40),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network(
                _product.imageUrl,
                height: 280,
                width: 280,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              _product.price,
              style: TextStyle(
                color: Colors.red[700],
                fontFamily: "Vazir",
                fontSize: 30,
              ),
            ),
            Text(
              _product.productName,
              style: TextStyle(
                color: Colors.grey[700],
                fontFamily: "Vazir",
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: Text(
                _product.description,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                  fontFamily: "Vazir",
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print("added to basket ${_product.productName}");
                      ShoppingBasketData.getInstance().basketItems.add(_product);
                      // ignore: avoid_print
                      print(ShoppingBasketData.getInstance().basketItems.length);
                      // ignore: unused_local_variable
                      var showsnachbar;
                      showsnachbar = Scaffold.of(context).showBottomSheet(
                        SnackBar(
                          content: Text("${_product.productName} "+"به سبد خرید شما افزوده شد",
                              style: const TextStyle(fontSize: 15,fontFamily: "Vazir")),
                        ) as WidgetBuilder
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red[600],
                          borderRadius: const BorderRadius.all(Radius.circular(10))),
                      width: MediaQuery.of(context).size.width - 50,
                      height: 70,
                      child: const Center(
                        child: Text(
                          "افزودن به سبد خرید",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Vazir",
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
