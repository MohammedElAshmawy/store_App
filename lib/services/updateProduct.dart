import 'package:store_app/Models/getAllProductsModel.dart';
import 'package:store_app/helper/helper.dart';

class UpdateProduct{

  Future<ProductsModel> updateProduct ({
    required String title,
    required int id,
    required String price,
    required String desc,
    required String image,
    required String category,
  })async{

    Map<String,dynamic> data=await api().put(
        url: 'https://fakestoreapi.com/products/$id',
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