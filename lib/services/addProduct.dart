import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/Models/getAllProductsModel.dart';
import 'package:store_app/helper/helper.dart';
class AddProduct{

Future<ProductsModel> addProduct ({
  required String title,
  required String price,
  required String desc,
  required String image,
  required String category
  })async{

  Map<String,dynamic> data=await api().post(
      url: 'https://fakestoreapi.com/products',
      body:{
        "title": title,
        "price": price,
        "description": desc,
        "image": image,
        "category": category
      });
  return ProductsModel.fromJson(data);
 }
}