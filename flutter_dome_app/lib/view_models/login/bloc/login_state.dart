import 'package:meta/meta.dart';

@immutable
abstract class LoginState {
}

class InitialLoginState extends LoginState {
}

// ignore: must_be_immutable
class SuccessLoginState extends LoginState {
  DateTime time;
  SuccessLoginState(this.time);
}

class FailureLoginState extends LoginState {}