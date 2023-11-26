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
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Builder(
        builder:(context)=> ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  _product.price + " تومان ",
                  style: TextStyle(
                    color: Colors.red[700],
                    fontFamily: "Vazir",
                    fontSize: 25,
                  ),
                ),
                Text(
                  _product.productName,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontFamily: "Vazir",
                    fontSize: 25,
                  ),
                ),
              ],
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
                textAlign: TextAlign.justify,
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5.0),
        child: GestureDetector(
          onTap: () {
            // ignore: avoid_print
            print("added to basket ${_product.productName}");

            // ignore: avoid_print
            // ShoppingBasketData _basket = ShoppingBasketData.getInstance();
            print("Get Cart instance");
            // _basket.basketItems += [_product];
            print(ShoppingBasketData.getInstance().basketItems.length);
            ShoppingBasketData.getInstance().basketItems.add(_product);
            print(ShoppingBasketData.getInstance().basketItems.length);

            // ignore: unused_local_variable
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  " به سبد خرید شما اضافه شد",
                  style: TextStyle(fontSize: 16),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),

                duration: Duration(seconds: 2),
                backgroundColor: Colors.green, // رنگ پس زمینه SnackBar
                behavior: SnackBarBehavior.floating,
              ),
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
    );
  }
}
