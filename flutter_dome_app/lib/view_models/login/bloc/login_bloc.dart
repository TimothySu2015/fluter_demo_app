import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginCredentials) {
      if (event.account == "test" && event.password == "000000") {
        yield SuccessLoginState();
      } else {
        yield FailureLoginState();
      }
    }
  }
}
