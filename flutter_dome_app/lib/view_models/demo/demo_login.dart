import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
             // color: Colors.transparent,
              child: Image.asset(
                'assets/images/bg_transparent.png',
          //      height: 200,
              ),
            ),
          ],

        ),
      ),
      //backgroundColor: Colors.white,
    );
  }
}
