import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/helper.dart';
class allCategoriesServices {

  Future<List<dynamic>> getAllCategories ()async{
    
     List<dynamic> data=await api().get(url: "https://fakestoreapi.com/products/categories");
       return data;        
     }
  }
