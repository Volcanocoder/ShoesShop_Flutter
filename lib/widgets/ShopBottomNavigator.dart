// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shoesShop/pages/ProfilePage.dart';

import '../pages/ShoppingBasket.dart';
import '../pages/StoreMainMenuPage.dart';


class ShopBottomNagiv extends StatelessWidget {
  const ShopBottomNagiv({super.key});



  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
         color: Colors.white,
        clipBehavior: Clip.antiAlias,

      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap:(){
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return Store();
                        }
                    ));
                  },
                    child: const Icon(Icons.home,color:Colors.blueGrey)),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return ProfilePage();
                        }
                    ));
                  },
                    child: const Icon(Icons.person_outline,color:Colors.blueGrey)),
                const Icon(Icons.search,color:Colors.blueGrey),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return ShoppingBasket();
                      }
                    ));
                  },
                    child: Icon(Icons.shopping_basket,color:Colors.blueGrey))
              ],
            ),

          ),

         ], 
        ),
        ),
     
        
      
      );
    
  }
}