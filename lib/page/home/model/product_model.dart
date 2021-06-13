/**
 *
 * @class name：
 * @class describe
 *@class name：
 * @author XUIELIANG
 * @time 2021/6/13 0013 13:40
 * @change
 * @chang time
 * @class describe
 */


class ProductModel{

  ProductModel({
    required this.name,
    required this.img,
    required this.num,
    required this.price,
  });

  String name;
  String img;
  int num;
  double price;
  bool isCollection = false;//是否收藏


  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json["name"],
    img: json["img"],
    num: json["num"],
    price: json["price"],

  );
}