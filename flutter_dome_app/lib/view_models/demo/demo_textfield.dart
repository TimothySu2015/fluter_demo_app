import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoTextField extends StatefulWidget {
  DemoTextField({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _demoTextFidldState();
  }
}

class _demoTextFidldState extends State<DemoTextField> {
  String _val = '';
  var _editController = TextEditingController();
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    _editController.addListener((){
      _val=_editController.text;
    });
  }

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField 練習'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Center(
              child: TextField(
                decoration: InputDecoration(labelText: 'Name'),
                controller: _editController,
              ),
            ),
            Center(child: Text(_val))
          ],
        ),
      ),
    );
  }
}
