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
import 'package:mvvm/page/home/model/product_model.dart';

class HomeServices{



  static Future<List<ProductModel>> getHomeList() async {

    List<ProductModel> _dataList = [];
    await Future.delayed(Duration(milliseconds: 2000),(){
      for(int i=0;i<100;i++){
        Map<String,dynamic> data = {
          'name': "产品名字",
          'num': 30,
          'price': 33.5,
          'img': 'HTTP',
        };
        _dataList.add(ProductModel.fromJson(data)) ;
      }

    });

    return _dataList;

//    final res = await Network.get(Api.homeList);
//    return res.data;
  }

}