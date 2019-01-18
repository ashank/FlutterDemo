import 'package:flutter/material.dart';



class MovieList extends StatefulWidget{

  @override
  State createState() {

    return new MovieListState();
  }
}


class  MovieListState  extends State<MovieList> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: Text("电影"),
        backgroundColor: Colors.black54,
        primary: true,
        centerTitle: true,
      ),


      body: ListView.builder(itemBuilder: getItem,itemCount: 50,),

    );



  }
}


Widget getItem(BuildContext context, int index){

  return Container(

    child: Card(color: Colors.white,
    ),

  );
}