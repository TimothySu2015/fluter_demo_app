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
  final items = List<String>.generate(100, (i) => "item $i");

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
                    ),
                    buildA(),
                    Container(width: 400.0,height: 30.0, child: ListView.builder(
                        scrollDirection: Axis.horizontal,

                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return buildA();// ListTile(title: Text('${items[index]}'));
                        }),)

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

  /// Ａ
  Widget buildA() {
    return Container(
      width: 40.0,
      height: 40.0,
      padding: EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        color: Color(0xFF9E9E9E),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
              'https://s.yimg.com/uu/api/res/1.2/wUcbOtttpBJ06IjoCje3xQ--~B/cT05NTtmaT1zdHJpbTtweW9mZj0wO3c9MjIwO2g9MjIwO2FwcGlkPXl0YWNoeW9u/https://media.zenfs.com/no/stormmediagroup.com/b088bf1686eb995e184df51560a67b6c.cf.jpg'),
        ),
        //     borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
        boxShadow: [
          BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(5.0, 10.0),
              blurRadius: 5.0)
        ],
      ),
    );
  }
}
