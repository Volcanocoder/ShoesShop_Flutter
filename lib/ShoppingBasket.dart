// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'ShoppingBasketData.dart';
import 'ShoppingBasketItem.dart';

class ShoppingBasket extends StatefulWidget {
  const ShoppingBasket({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingBasketState createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "سبد خرید",
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
      body: basketUI(),
    );
  }

  Widget basketUI() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 85),
          child: ListView.builder(
            itemCount: ShoppingBasketData.getInstance().basketItems.length,
            itemBuilder: (context, postion) {
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ShoppingBasketItem(
                      ShoppingBasketData.getInstance().basketItems[postion],
                      removeItem,
                      postion),
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.red,
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 85,
                child: const Center(
                  child: Text(
                    "پرداخت",
                    style: TextStyle(
                        fontFamily: "Vazir", fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void removeItem(int index) {
    setState(() {
      ShoppingBasketData.getInstance().basketItems.removeAt(index);
    });
  }
}
