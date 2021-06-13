///
/// @class name：
/// @class describe
///@class name：
/// @author XUIELIANG
/// @time 2021/6/13 0013 13:40
/// @change
/// @chang time
/// @class describe

import 'package:flutter/material.dart' show BuildContext, State, StatefulWidget, Widget;
import 'package:mvvm/base/base_view_model.dart';
import 'package:mvvm/widget/loding/LoadingWidget.dart';
import 'package:provider/provider.dart';

abstract class BaseState<T extends StatefulWidget, M extends BaseViewModel>
    extends State<T> {
  late M viewModel;
  late String pageName;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return build(context);
  }

  Widget initWiew() {
    return Consumer<M>(builder: (BuildContext, provie, _) {
      return viewModel.isLoading ? LoadingWidget() : buildView();
    });
  }

  Widget buildView();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies: ${pageName}界面");
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget: ${pageName}界面");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate:${pageName}界面");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose 离开${pageName}界面");
    print("销毁${pageName}界面");
  }
}
