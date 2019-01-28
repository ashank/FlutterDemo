import 'package:flutter/material.dart';
import 'second_page.dart';
import 'color.dart';

List<String> list = new List();

class MainList extends StatefulWidget {

  @override
  State createState() {

    list.add('文字显示');
    list.add('图片显示');
    list.add('按钮显示');

    for (int i = 0; i < 21 ; i++){
      list.add("第一次"+i.toString());
    }

    return _ListState();
  }
}


class _ListState extends State<MainList> {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 7,
        child: Scaffold(
            appBar: new AppBar(

              title: Text("首页"),
              backgroundColor: Color(color_ff455a64),
              primary: true,
              leading: IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                    //do
                  }),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.add_alarm),
                    tooltip: 'add',
                    onPressed: () {
                      //do
                    }),

              ],


              bottom: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  indicatorWeight: 4,
                  onTap: (int position) {
                    //do
                  },
                  tabs: <Widget>[
                    Tab(text: '选项1'),
                    Tab(text: '选项2'),
                    Tab(text: '选项3'),
                    Tab(text: '选项4'),
                    Tab(text: '选项5'),
                    Tab(text: '选项6'),
                    Tab(text: '选项7'),
                  ]
              ),
            ),

            backgroundColor: Color(0xFFFFFFFF),

            body: ListView.builder(itemCount: 30, itemBuilder: buildItem),
        )
    );

  }


  _ListState();

  Widget buildItem(BuildContext context, int index){

    if(index > list.length-1){
      return null;
    }

    //设置字体样式
    TextStyle textStyle =
    new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0 );

    return new Container(

      child: new Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[

          new GestureDetector(

            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new SecondScreen()),
              );
            },

            child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(list[index], style: textStyle),
              ),
          ),
          new Divider()
        ],
      ),
    );
  }

}

