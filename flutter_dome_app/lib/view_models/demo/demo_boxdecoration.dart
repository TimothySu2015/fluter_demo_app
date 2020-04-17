import 'package:flutter/material.dart';

class DemoBoxDecoration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DemoBoxDecorationState();
  }
}

class _DemoBoxDecorationState extends State<DemoBoxDecoration> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('DemoBoxDecorationState')),
      body: Center(
        child: InkWell(
            onTap: () => print("image clicked"),
            splashColor: Colors.red,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(4, 3))
              ], shape: BoxShape.circle),
              // padding: EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 32,
              ),
            )),
      ),
    );
  }
}
