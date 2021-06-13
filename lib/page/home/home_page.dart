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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/base/base_state.dart';
import 'package:mvvm/widget/refresher_footer/refresher_footer.dart';
import 'package:mvvm/widget/refresher_header/refresher_header.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'model/product_model.dart';
import 'viewmodel/homeviewmodel.dart';

class HomePager extends StatefulWidget {
  @override
  _HomePagerState createState() => _HomePagerState();
}

class _HomePagerState extends BaseState<HomePager, HomeViewModel> {




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageName = "首页";
    viewModel = new HomeViewModel(context);
    viewModel.refreshData(isShowLoading: true);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text("sd"),
        ),

        body: initWiew(),
      ),
    );
  }

  @override
  Widget buildView() {
    return Container(
      child: Column(
        children: [
           Expanded(child: SmartRefresher(
             enablePullDown: true,
             enablePullUp: true,

             controller: viewModel.refreshController,
             onRefresh: () async{
               viewModel.page = 0;
               viewModel.refreshData(isShowLoading: false);
               print("======正在下拉刷新");
             },
             onLoading: () async {
               viewModel.refreshData(isShowLoading: false);
               print("======正在上拉加载");
             },

             child: ListView.builder(
                 itemCount: viewModel.dataList.length,
                 itemBuilder: (conetxnt, index) {
                   ProductModel productModel = viewModel.dataList[index];
                   return Text("=${productModel.name}");
                 }),
           ))
        ],
      ),
    );
  }
}
