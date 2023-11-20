// ignore_for_file: file_names

import 'package:flutter/material.dart';


class ShopBottomNagiv extends StatelessWidget {
  const ShopBottomNagiv({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
         color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,

      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width/2-20,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home,color:Colors.blueGrey),
                Icon(Icons.person_outline,color:Colors.blueGrey)
              ],
            ),

          ),
          SizedBox(
            height: 50,
             width: MediaQuery.of(context).size.width/2-20,
             child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.search,color:Colors.blueGrey),
                Icon(Icons.shopping_basket,color:Colors.blueGrey)
              ],
            ),

          )
         ], 
        ),
        ),
     
        
      
      );
    
  }
}