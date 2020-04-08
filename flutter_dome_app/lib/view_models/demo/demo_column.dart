import 'package:flutter/material.dart';

class DemoColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Column 練習'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              width: 100,
              height: 100,
              color: Colors.deepPurple,
              child: Text('box01'),
            ),
            Container(
                margin: EdgeInsets.all(5),
                width: 100,
                height: 100,
                color: Colors.red,
                child: Text('box02')),
          ],
        ),
      ),
    );
  }
}
