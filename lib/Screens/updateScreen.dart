import 'package:flutter/material.dart';
import 'package:store_app/Models/getAllProductsModel.dart';
import 'package:store_app/helper/helper.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/services/updateProduct.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class updateScreen extends StatefulWidget {
   updateScreen({Key? key}) : super(key: key);

   static String id="update screen";


  @override
  State<updateScreen> createState() => _updateScreenState();
}

class _updateScreenState extends State<updateScreen> {
   String? name,desc,image;
   bool isLoading=false;
   String? price;

  @override
  Widget build(BuildContext context) {
    var product=ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Product',style:
            TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              TextField(
                onChanged:(data){
                  name=data;
                },
                  decoration:InputDecoration(
                  label: Text('Product Name'),
                  hintText: "type product name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                onChanged: (data){
                  desc=data;
                },
                decoration:InputDecoration(
                  label: Text('description'),
                  hintText: "type product name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                onChanged: (data){
                },
                keyboardType: TextInputType.number,
                decoration:InputDecoration(
                  label: Text('Price'),
                  hintText: "type product name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                onChanged: (data){
                  image=data;
                },
                decoration:InputDecoration(
                  label: Text('image'),
                  hintText: "type product name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.orange
                ),
                child: MaterialButton(
                    onPressed: ()  {
                      isLoading=true;
                      setState(() {
                      });
                      try {
                        UpdateMethod(product);
                        print('success');
                      }catch(e){
                        print('failed');
                        print(e.toString());
                      }
                      isLoading=false;
                      setState(() {
                      });
                    },
                    child: Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> UpdateMethod(ProductsModel product) async {
    UpdateProduct().updateProduct(
        id:product.id ,
        title: name==null? product.title.toString(): name.toString(),
        price: price==null? product.price.toString():price.toString(),
        desc: desc==null? product.description.toString():desc.toString(),
        image: image==null? product.image.toString():image.toString(),
        category: product.category);

  }
}
