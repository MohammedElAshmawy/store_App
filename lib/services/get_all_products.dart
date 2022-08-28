import 'package:http/http.dart' as http;
import 'package:store_app/Models/getAllProductsModel.dart';
import 'package:store_app/helper/helper.dart';

// Status code is a number that know the state of the request
// if it 200 then it's ok , 400 then the problem in our connection ,500 the problem at the server
  class allProductServices{
     Future<List<ProductsModel>> getProducts() async{
            List<dynamic> data=await api().get(url: "https://fakestoreapi.com/products");
              List<ProductsModel> productList = [];
              for (int i = 0; i < data.length; i++) {
                   productList.add(
                       ProductsModel.fromJson(data[i])
                   );
              }
              return productList;
     }
}