import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdomeapp/view_models/demo/demo_boxdecoration.dart';
import 'package:flutterdomeapp/view_models/login/bloc/bloc.dart';

import 'view_models/login/bloc/bloc.dart';
import 'view_models/demo/demo.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<Widget> items;

  @override
  Widget build(BuildContext context) {
    items = [
      ListTile(
        title: Text('Column Demo'),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DemoColumn()));
          print('Column Demo');
        },
      ),
      ListTile(
        title: Text('Row Demo'),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DemoRow()));
          print('Row Demo');
        },
      ),
      ListTile(
        title: Text('ListView'),
      ),
      ListTile(
        title: Text('ListViewBuild'),
      ),
      ListTile(
        title: Text('TextField Demo'),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DemoTextField()));
          print('TextField Demo');
        },
      ),
      ListTile(
        title: Text('Stack'),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DemoStack()));
          print('TextField Demo');
        },
      ),
      ListTile(
        title: Text('BoxDecoration'),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DemoBoxDecoration()));
          print('BoxDecoration Demo');
        },
      ),
      ListTile(
        title: Text('DemoCanvas'),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DemoCanvas()));
          print('DemoCanvas Demo');
        },
      ),
    ];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo2"),
      ),
      body: ListView(
        children: items,
      ),
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

//  final items = List<String>.generate(100, (i) => "item $i");

//  static DateTime current = DateTime.now();
//  Stream timer = Stream.periodic(Duration(seconds: 1), (i) {
//    current = current.add(Duration(seconds: 1));
//    return current;
//  });

  @override
  void initState() {
    //timer.listen((data)=>print(data));

    super.initState();
  }

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
                  ],
                ),
              );
            },
          )),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          print('click');
//          _counter++;
//          BlocProvider.of<LoginBloc>(context).add(
//              LoginCredentials(account: account.text, password: password.text));
//        },
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
