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

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import 'widget/tabs/MainBottomBar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
        maxOverScrollExtent: 100, //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
        footerTriggerDistance: -60, // 底部触发刷新的越界距离
        maxUnderScrollExtent: 100, // 底部最大可以拖动的范围
        enableScrollWhenRefreshCompleted:
        true, //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
        enableLoadingWhenFailed: true, //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
        hideFooterWhenNotFull: false, // Viewport不满一屏时,禁用上拉加载更多功能
        enableBallisticLoad: true,
        //
        headerBuilder: () => WaterDropHeader(),        // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
        footerBuilder:  () => ClassicFooter(),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),

          home: MainBottomBar(),
          localizationsDelegates: [
            RefreshLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],

          supportedLocales: [
            const Locale('en'),
            const Locale('zh'),
            const Locale('ja'),
            const Locale('uk'),
            const Locale('it'),
            const Locale('ru'),
            const Locale('fr'),
            const Locale('es'),
            const Locale('nl'),
            const Locale('sv'),
            const Locale('pt'),
            const Locale('ko'),
          ],
          locale: const Locale('zh'),
          localeResolutionCallback:
              (Locale? locale, Iterable<Locale> supportedLocales) {
            //print("change language");
            return locale;
          },

          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              child: child!,
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            );
          },
        ));
  }
}
