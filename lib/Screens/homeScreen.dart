import 'package:flutter/material.dart';
import 'package:store_app/Models/getAllProductsModel.dart';
import 'package:store_app/Widgets/cutomCard.dart';
import 'package:store_app/services/get_all_products.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("New Trend",
            style:TextStyle(
              color: Colors.black
            ),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon:Icon(Icons.shopping_cart),
              color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: FutureBuilder<List<ProductsModel>>(
          future: allProductServices().getProducts(),
          builder:(context,snapshot){
            if(snapshot.hasData){
              //print(snapshot.stackTrace);
            List<ProductsModel> products=snapshot.data!;
            return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  childAspectRatio: .9,
                  crossAxisSpacing:10,
                  mainAxisSpacing: 30,
                ),
                itemBuilder:(context,index)=>customCard(product:products[index],));
            }
            else
             {
              return Center(child: CircularProgressIndicator());
            }
          },
        )
      )
    );
  }
}