import 'package:http/http.dart' as http;
import 'package:store_app/Models/getAllProductsModel.dart';
import 'package:store_app/helper/helper.dart';

class getCategory {
  Future<List<ProductsModel>> getOneCategory({required String categoryName}) async{
      List<dynamic> data =await api().get(url:"https://fakestoreapi.com/products/category/$categoryName");
        List<ProductsModel> productList = [];
          for (int i = 0; i < data.length; i++) {
             productList.add(
               ProductsModel.fromJson(data[i])
        );
      }
      return productList;
  }
}