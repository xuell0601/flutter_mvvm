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
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/base/base_view_model.dart';
import 'package:mvvm/page/home/model/product_model.dart';
import 'package:mvvm/page/home/services/HomeServices.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeViewModel extends BaseViewModel{
  HomeViewModel(BuildContext context) : super(context);
  // 页数
  int _page = 0;
  int get page => _page;
  set page(int page) {
    _page = page;
  }

  List <ProductModel> _dataList = [];
  List<ProductModel> get dataList => _dataList;
  set dataList(List<ProductModel> arr) {
    _dataList = arr;
    this.notifyListeners();
  }

  RefreshController _refreshController = RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  @override
  Future refreshData({bool isShowLoading = false}) async {
    this.isLoading = isShowLoading;

    if(_page==0){
      _dataList.clear();
      HomeServices.getHomeList().then((data){


        _dataList.addAll(data) ;

        // if(_dataList.length>=30){
        //   _refreshController.loadNoData();
        // }else{
        //   _refreshController.resetNoData();
        // }
        _page++;
        this.isLoading = false;
        this.notifyListeners();

      }).catchError((e){
        print("======获取首页列表异常$e");
      });
      _refreshController.refreshCompleted();

    }else{

      await Future.delayed(Duration(milliseconds: 1000));
      HomeServices.getHomeList().then((data){


        _dataList.addAll(data) ;

        // if(_dataList.length>=30){
        //   _refreshController.loadNoData();
        // }else{
        //   _refreshController.resetNoData();
        // }
        _page++;
        this.isLoading = false;
        this.notifyListeners();

      }).catchError((e){
        print("======获取首页列表异常$e");
      });
      _refreshController.loadComplete();
    }



  }


}