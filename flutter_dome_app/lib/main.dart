import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdomeapp/view_models/login/bloc/bloc.dart';

import 'pages/home/home.dart';
import 'view_models/login/bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final account = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
          create: (context) => LoginBloc(),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (BuildContext context, LoginState state) {
              print('state change');

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('account:'),
                        Container(
                          width: 100, // do it in both Container
                          child: TextField(
                            controller: account,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('password:'),
                        Container(
                          width: 100, // do it in both Container
                          child: TextField(
                            controller: password,
                            obscureText: true,
                          ),
                        )
                      ],
                    ),
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.display1,
                    ),
                    Text(state.toString()),
                    SizedBox(
                      width: 100.0,
                      child: RaisedButton(
                        onPressed: () {
                          _counter++;
                          BlocProvider.of<LoginBloc>(context).add(
                              LoginCredentials(
                                  account: account.text,
                                  password: password.text));
                        },
                        child: Text("test"),
                      ),
                    )
                  ],
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('click');
          _counter++;
          BlocProvider.of<LoginBloc>(context).add(
              LoginCredentials(account: account.text, password: password.text));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
