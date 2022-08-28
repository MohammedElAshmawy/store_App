import 'package:flutter/material.dart';
import 'package:store_app/Models/getAllProductsModel.dart';
import 'package:store_app/Screens/updateScreen.dart';

class customCard extends StatelessWidget {

  customCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50,left: 5),
      child: GestureDetector(
        onTap:(){
          Navigator.pushNamed(context,updateScreen.id,arguments: product);
          //this navigator used to pass an object (product) with the navigator to use it in the screen you will go to it
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                    blurRadius: 40,
                    color: Colors.grey.withOpacity(.6),
                    spreadRadius: 1
                 ),
                ],
              ),
              child: Card(
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(product.title.substring(0,15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        children: [
                          Text(product.price.toString()),
                          Spacer(),
                          IconButton(
                            color: Colors.red,
                            onPressed: (){},
                            icon:Icon(Icons.favorite
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 90,
              child: Image.network(product.image,
                height: 100,
                width: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}