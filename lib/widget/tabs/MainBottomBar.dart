import 'package:flutter/material.dart';
import 'package:mvvm/page/home/home_page.dart';
import 'package:mvvm/page/me/me_pager.dart';
import 'package:mvvm/page/search/search_pager.dart';
import 'package:mvvm/page/shop/shop_pager.dart';
import 'package:mvvm/widget/icons/icons.dart';

class MainBottomBar extends StatefulWidget {
  @override
  _MainBottomBarState createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  late List<Widget> ContentTab = [
    HomePager(),
    ShopPager(),
    SearchPager(),
    MePager()
  ];
  int CurnntPage = 0;
  late PageController  _pageController;

  final List<BottomNavigationBarItem> bootonItems = [];

  @override
  void initState() {
    super.initState();
    //初始化底部导航
    _pageController = PageController(initialPage: CurnntPage );
    initsBootom();
  }

  /**
   * 底部导航栏的创建
   */
  void initsBootom() {
    bootonItems.add(BottomNavigationBarItem(
      icon: Icon(
        IconFont.home_outline,
        color: Color(0xFF262626),
        size: 28.0,
      ),
      activeIcon: Icon(
        IconFont.home,
        color: Color(0xFFDFBE84),
        size: 28.0,
      ),
      title: Text('首页'),
    ));
    bootonItems.add(BottomNavigationBarItem(
      icon: Icon(
        IconFont.mall_outlline,
        color: Color(0xFF262626),
        size: 28.0,
      ),
      activeIcon: Icon(
        IconFont.mall,
        color: Color(0xFFDFBE84),
        size: 28.0,
      ),
      title: Text('商城'),
    ));
    bootonItems.add(BottomNavigationBarItem(
      icon: Icon(
        IconFont.shoe_outline,
        color: Color(0xFF262626),
        size: 28.0,
      ),
      activeIcon: Icon(
        IconFont.shoe,
        color: Color(0xFFDFBE84),
        size: 28.0,
      ),
      title: Text('发现'),
    ));
    bootonItems.add(BottomNavigationBarItem(
      icon: Icon(
        IconFont.person_outline,
        color: Color(0xFF262626),
        size: 28.0,
      ),
      activeIcon: Icon(
        IconFont.person,
        color: Color(0xFFDFBE84),
        size: 28.0,
      ),
      title: Text('我的'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: ContentTab,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: CurnntPage,
        items: bootonItems,
        onTap: (index) {
          setState(() {
            CurnntPage = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
