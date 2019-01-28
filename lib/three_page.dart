import 'package:flutter/material.dart';
import 'color.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


List subjects = new List();
String title ="电影";

class MovieList extends StatefulWidget{

  @override
  State createState() {
    return new MovieListState();
  }

}


class  MovieListState  extends State<MovieList> {

  loadData() async {
    String loadRUL = "https://api.douban.com/v2/movie/in_theaters";
    http.Response response = await http.get(loadRUL);

    if(response.statusCode == 200) {
      var result = json.decode(response.body);
      setState(() {
        title = result['title'];
        print('title: $title');
        subjects = result['subjects'];
      });
    } else {
      //错误提示
      print("Request failed with status: ${response.statusCode}.");
    }

  }

  @override
  Widget build(BuildContext context) {
    //加载的数据
    loadData();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color(color_ff455a64),
        primary: true,
        centerTitle: true,
      ),
      body: getBody(),
    );
  }
}


Widget getBody(){
  if(subjects.length == 0) {
    return Center(
      child:  CupertinoActivityIndicator(
        radius: 12,
      ),
    );
  }
  return ListView.builder(
    itemBuilder: getItem,
    itemCount: subjects.length,
  );

}

Widget getItem(BuildContext context, int index){

  if(subjects.length == 0) {
    return CupertinoActivityIndicator();
  }

  var subject = subjects[index];

  var avatars = List.generate(subject['casts'].length, (int i) => Container(
    margin: EdgeInsets.only(left: i.toDouble() == 0.0 ? 0.0 : 16.0),
    child: Column(
      
      children: <Widget>[

        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.grey[350],
          backgroundImage: NetworkImage('${subject['casts'][i]['avatars']['small']}',),
        ),

        Text(
          '${subject['casts'][i]['name']}',
          style: TextStyle(fontSize: 10),
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.fade,)
        
      ],
    )
        
    
    
  ));

  const TextStyle textStyle = TextStyle(fontSize: 14);
  const TextStyle textStyle2 = TextStyle(fontSize: 16,fontWeight: FontWeight.bold);

  return Container(
    child: Card(
      color: Color(color_fffafafa),
      margin: EdgeInsets.all(6.0),
      elevation: 6,
      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedOpacity(
            opacity: 1.0,
            duration: Duration(seconds: 2),
            child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0),bottomLeft: Radius.circular(4.0)),
            child:  Image.network(
              '${subject['images']['medium']}',
              alignment: Alignment.topLeft,
              color: Colors.green,
              colorBlendMode: BlendMode.dstATop,
              filterQuality: FilterQuality.medium,
              fit: BoxFit.cover,
              width: 100,
              height: 160,
            ),
          ),),

          Container(
            margin: EdgeInsetsDirectional.only(start: 20, top: 10,bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Text('${subjects[index]['title']}', style: textStyle2, maxLines: 1,),

                Container(
                  margin: EdgeInsetsDirectional.only(top: 8),
                  child: Row(
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text('豆瓣评分：', style: textStyle),
                      Text('${subject['rating']['average']}', style: textStyle)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 8),
                  child: Row(
                    children: <Widget>[
                      Text('类型：', style: textStyle),
                      Text('${subject['genres']}', style: textStyle)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 8),
                  child: Row(
                    children: <Widget>[
                      Text('导演：', style: textStyle),
                      Text('${subject['directors'][0]['name']}', style: textStyle)
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsetsDirectional.only(top: 8),
                  child: Row(
                    children: <Widget>[
                      Text('主演：', style: textStyle),
                      Row(children: avatars,)
                    ],
                  ),
                ),
              ],

            ),
          )



        ],
      ),

    ),

  );
}