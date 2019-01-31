import 'package:flutter/material.dart';
import 'color.dart';

//电影详情
class MovieDetail extends StatefulWidget {
  final data;
  MovieDetail({Key key, @required this.data}): super(key:key);

  @override
  State createState() {
    return MovieDetailState(data: data);
  }

}

class MovieDetailState extends State<MovieDetail> {
  var data;
  MovieDetailState({@required this.data}): super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBody(context,data),
    );
  }
}

Widget createBody(BuildContext context,var data){

  var avatars = List.generate(data['casts'].length, (int i) => Container(
      width: 80,
      margin: EdgeInsets.only(left: i.toDouble() == 0.0 ? 0.0 : 15.0),

      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[350],
            backgroundImage: NetworkImage('${data['casts'][i]['avatars']['small']}',),
          ),
          Text(
              '${data['casts'][i]['name']}',
              style: TextStyle(fontSize: 14, fontFamily: "Roboto"),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis),
        ],
      )
  ));



  return CustomScrollView(
    shrinkWrap: false,
    slivers: <Widget>[
      SliverAppBar(
        floating: false,
        snap: false,
        pinned: true,
        actions: <Widget>[
          //右边控件
        ],
        elevation: 10,
        primary: true,
        centerTitle: true,
        backgroundColor:AppColors.color_ff455a64 ,
        title: Text("详情"),
        expandedHeight: MediaQuery.of(context).size.height/3,
        flexibleSpace: FlexibleSpaceBar(
          background:  Image.network(
            '${data['images']['large']}',
            alignment: Alignment.topLeft,
            color: Colors.green,
            colorBlendMode: BlendMode.dstATop,
            filterQuality: FilterQuality.high,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
        ),
        ),
      ),

      SliverPadding(padding: EdgeInsets.all(15),
        sliver: SliverList(delegate: SliverChildListDelegate(
            <Widget>[

              Row(
                children: <Widget>[
                  Text('主演：', style: TextStyle(fontSize: 16)),
                  Row(children: avatars,)
                ],
              ),


              Container(
                height: 20,
              ),


              Text(
                  "     在机器人的发展过程中，赋予机器人以情感是最富有争议的，也是最后未能做到的事。通常机器人被视作为一个极其复杂的装置，人们认为他们不会具备感情。但是，有很多父母失去了自己的孩子，时代的需要就使这种可能性大大增加了。终于，Cybertronics Manufacturing制作公司着手解决了这个问题，制造出了第一个具有感情的机器人。他的名字叫大卫（海利·乔·奥斯蒙特饰），作为第一个被输入情感程序的机器男孩，大卫是这个公司的员工亨瑞和他的妻子的一个试验品，他们夫妻俩收养了大卫。而他们自己的孩子却最终因病被冷冻起来，以期待有朝一日，有一种能治疗这种病的方法会出现。尽管大卫逐渐成了他们的孩子，拥有了所有的爱，成为了家庭的一员。但是，一系列意想不到的事件的发生，使得大卫的生活无法进行下去。人类与机器最终都无法接受他，大卫只有唯一的一个伙伴机器泰迪——他的超级玩具泰迪熊，也是他的保护者。大卫开始踏上了旅程，去寻找真正属于自己的地方。他发现在那个世界中，机器人和机器之间的差距是那么的巨大，又是那么的脆弱。他要找寻自我、探索人性，成为一个真正意义上的人。"),
              Container(
                height: 20,
              ),

              Text(
                  "     在机器人的发展过程中，赋予机器人以情感是最富有争议的，也是最后未能做到的事。通常机器人被视作为一个极其复杂的装置，人们认为他们不会具备感情。但是，有很多父母失去了自己的孩子，时代的需要就使这种可能性大大增加了。终于，Cybertronics Manufacturing制作公司着手解决了这个问题，制造出了第一个具有感情的机器人。他的名字叫大卫（海利·乔·奥斯蒙特饰），作为第一个被输入情感程序的机器男孩，大卫是这个公司的员工亨瑞和他的妻子的一个试验品，他们夫妻俩收养了大卫。而他们自己的孩子却最终因病被冷冻起来，以期待有朝一日，有一种能治疗这种病的方法会出现。尽管大卫逐渐成了他们的孩子，拥有了所有的爱，成为了家庭的一员。但是，一系列意想不到的事件的发生，使得大卫的生活无法进行下去。人类与机器最终都无法接受他，大卫只有唯一的一个伙伴机器泰迪——他的超级玩具泰迪熊，也是他的保护者。大卫开始踏上了旅程，去寻找真正属于自己的地方。他发现在那个世界中，机器人和机器之间的差距是那么的巨大，又是那么的脆弱。他要找寻自我、探索人性，成为一个真正意义上的人。"),
            ])
        ),
      ),
    ],
  );
}




