import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterdomeapp/repositorys/remote/model/remote_model_login.dart';
import 'package:flutterdomeapp/repositorys/remote/model/remote_result.dart';
import './bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginCredentials) {
      try {
      //  print(event.account);
        var result =
            await callLogin(account: event.account, password: event.password);
        print(result.accessToken);
        yield SuccessLoginState();
      } catch (_) {
        yield FailureLoginState();
      }
    }
  }

  // ignore: missing_return
  Future<LoginModel> callLogin(
      {@required String account, @required String password}) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final param =
        LoginParam(storeAccount: account, storePassword: password).toJson();

    final req = await http.post('http://*****/api/Account/Login',
        headers: headers, body: json.encode(param));
    if (req.statusCode == 200) {
      var result =
          RemoteResult<LoginModel>.fromJson(json.decode(req.body)).data;
      return result;
    } else if (req.statusCode == 500) {
      print(req.body);
    } else {
   //   print(req。);
      throw "Can't get posts.";
    }
  }
}
