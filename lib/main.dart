import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'bottom_navigation_widget.dart';
import 'first_page.dart';
import 'three_page.dart';



void main() {

  runApp(new MyApp());

  if(Platform.isAndroid){

    //以下两行 设置android状态栏为透明的沉浸。
    // 写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏
    // 写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 开发实例',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: BottomNavigationWidget(getContents(), getTabs())
    );
  }

}


List<Widget> getContents() {

  List<Widget>  contents = new List<Widget>();

  contents.add(MainList());
  contents.add(Text('推荐'));
  contents.add(MovieList());
  contents.add(Text('我的'));

  return contents;

}


List<BottomNavigationBarItem> getTabs() {

  List<BottomNavigationBarItem> tabs = new List();
  tabs.add(BottomNavigationBarItem(
      icon: Icon(Icons.add_a_photo, color: Colors.black87),
      activeIcon: Icon(Icons.add_a_photo, color: Colors.deepOrange),
      title: Text('首页', style: TextStyle(color: Colors.black54)
      )
  )
  );

  tabs.add(BottomNavigationBarItem(
      icon: Icon(Icons.category, color: Colors.black87),
      activeIcon:  Icon(Icons.category, color: Colors.deepOrange),
      title: Text('分类', style: TextStyle(color: Colors.black87)
      )
  )
  );
  tabs.add(BottomNavigationBarItem(
      icon: Icon(Icons.all_inclusive, color: Colors.black87),
      activeIcon: Icon(Icons.all_inclusive, color: Colors.deepOrange),
      title: Text('电影', style: TextStyle(color: Colors.black87)
      )
  )
  );
  tabs.add(BottomNavigationBarItem(
      icon: Icon(Icons.filter_vintage, color: Colors.black87),
      activeIcon: Icon(Icons.filter_vintage, color: Colors.deepOrange),
      title: Text('我的', style: TextStyle(color: Colors.black87)
      )
  )
  );

  return tabs;
}


