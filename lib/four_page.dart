import 'package:flutter/material.dart';
import 'color.dart';
import 'string.dart';



class FourPage extends StatefulWidget{

  @override
  State createState() {

    return new FourPageState();
  }
}


class  FourPageState  extends State<FourPage> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: Text(string_me),
        backgroundColor: Color(color_ff455a64),
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