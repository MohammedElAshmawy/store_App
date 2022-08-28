class ProductsModel {

  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;
  final RatingModel? rating;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.rating
  });

   factory ProductsModel.fromJson(jsonData){ // jsonData is the MAP that will be return
     return ProductsModel(
         id: jsonData['id'],
         title: jsonData['title'],
         price: jsonData['price'],
         description: jsonData['description'],
         image: jsonData['image'],
         category: jsonData['category'],
         rating: jsonData['rating']==null? null:RatingModel.fromJson(jsonData['rating'])
     );
   }
}

class RatingModel {

  final dynamic rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count
});

  factory RatingModel.fromJson(jsonDate){

    return RatingModel(
        rate:jsonDate['rate'],
        count:jsonDate['count']);
   }
  }