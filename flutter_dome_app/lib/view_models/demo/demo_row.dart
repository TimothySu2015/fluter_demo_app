import 'package:flutter/material.dart';


class DemoRow extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Row 練習'),),
      body: Center(child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(width: 100,height: 100, color: Colors.green,),
              Container(width: 100,height: 100, color: Colors.blue,),
            ],
          ),
          Container(width: 100,height: 100, color: Colors.red,),
          Container(width: 100,height: 100, color: Colors.blue,),
          Container(width: 100,height: 100, color: Colors.yellow,),
        ],
      ),),
    );
  }

}