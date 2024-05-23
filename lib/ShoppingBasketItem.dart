// ignore_for_file: file_names, prefer_final_fields, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'Product.dart';

typedef OnRemovePressed = Function(int index);

// ignore: must_be_immutable
class ShoppingBasketItem extends StatefulWidget {
  Product _product;
  int _count = 0;
  final int _index;
  OnRemovePressed _onRemovePressed;
  ShoppingBasketItem(this._product, this._onRemovePressed, this._index, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingBasketItemState createState() => _ShoppingBasketItemState();
}

class _ShoppingBasketItemState extends State<ShoppingBasketItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(right: 20,),
                  child: Image.network(
                    widget._product.imageUrl,
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20),
                  child: Text(
                    widget._product.productName,
                    style: const TextStyle(fontFamily: "Vazir", fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,right: 20),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      GestureDetector(
                        child: const Icon(
                          Icons.chevron_right,
                          size: 35,
                        ),
                        onTap: () {
                          Decrement();
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget._count.toString(),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                          onTap: () {
                            Increment();
                          },
                          child: const Icon(
                            Icons.chevron_left,
                            size: 35,
                          )),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 20, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          widget._onRemovePressed(widget._index);
                        },
                        child: const Icon(Icons.delete_outline),
                      ),
                      Container(
                        child: Text(
                          widget._product.price,
                          style: const TextStyle(fontFamily: "Vazir", fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void Increment() {
    setState(() {
      widget._count++;
    });
  }

  // ignore: non_constant_identifier_names
  void Decrement() {
    setState(() {
      if (widget._count == 0)
        return;
      else {
        widget._count--;
      }
    });
  }
}
