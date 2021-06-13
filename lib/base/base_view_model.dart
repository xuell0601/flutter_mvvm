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
import 'package:flutter/widgets.dart';

abstract class BaseViewModel with ChangeNotifier {
  BuildContext context;

  BaseViewModel(this.context);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    if (_isLoading != isLoading) {
      _isLoading = isLoading;
    }
    notifyListeners();
  }

  ///刷新数据
  @protected
  Future refreshData({bool isShowLoading = true});
}
