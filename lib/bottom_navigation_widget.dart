import 'package:flutter/material.dart';


/**
 *
 * 底部选项卡的view和内容显示框架
 */

@required
List<Widget> contentWidgets;
@required
List<BottomNavigationBarItem> tabWidgets;
int currentPosition = 0;

class BottomNavigationWidget extends StatefulWidget {

  BottomNavigationWidget(List<Widget> contents,List<BottomNavigationBarItem> tabs){

    contentWidgets = contents;
    tabWidgets = tabs;

  }

  @override
  State<StatefulWidget> createState() {

    return BottomNavigationWidgetState();
  }

}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: contentWidgets[currentPosition],

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentPosition,
        onTap: (int position){

          setState(() {
            currentPosition = position;
          });
        },
        items: tabWidgets,
        type: BottomNavigationBarType.fixed,

      ) ,

    );

  }
}