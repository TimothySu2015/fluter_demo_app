import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DemoStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    var t = (_width - 130.0)/2;
    print(t);
    print(_width);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Demo'),
      ),
      body: Center(
        child: Container(
          width: 600,
          height: 600,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                color: Colors.blue,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.blueGrey[200],
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              Positioned(
                child:
                InkWell(
                  onTap: (){
                    print('123');

                  },
                  splashColor: Colors.red,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Text('TIMOTHY'),
                    radius:t,
                  ),
                ),
                left: 0.0,
                right: 0.0,
                top: -30,
              )
            ],
          ),
          decoration: BoxDecoration(color: Colors.yellow),
        ),
      ),
    );
  }
}
