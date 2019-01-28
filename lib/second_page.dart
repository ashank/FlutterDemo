import 'package:flutter/material.dart';
import 'color.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('${this} hashCode=${this.hashCode}');
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Color(color_ff455a64),
          primary: true,
          title: Text('组件'),
          //状态的文字色彩模式
          brightness: Brightness.dark,
          centerTitle: true,
        ),
        body:  Column(
          children: <Widget>[ image, titleContent, button],
        ),
    );
  }
}

//内容
Widget titleContent = Container(
  padding: EdgeInsets.all(10),
  margin: EdgeInsets.all(10),
  child: Row(
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "我是你的风沙",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      )
    ],
  ),
);


Widget image = Container(



  child: Column(
    children: <Widget>[
      Image.network(
        "http://pic26.photophoto.cn/20130122/0034034823346617_b.jpg",
        alignment: Alignment.topLeft,
        color: Colors.green,
        colorBlendMode: BlendMode.dstATop,
        fit: BoxFit.contain,
      ),

      Image.asset('images/timg.jpg'),

    ],
  ),

);


Widget button = Container(
  alignment: AlignmentDirectional.center,
  padding: EdgeInsets.all(5.0),
  child: Center(
    child: Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Icon(Icons.home,color: Colors.red[500]),
            Text("通讯录"),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(Icons.home,color: Colors.red[500]),
            Text("推荐"),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(Icons.home,color: Colors.red[500]),
            Text("我的"),
          ],
        ),
      ],
    ),
  ),
);
