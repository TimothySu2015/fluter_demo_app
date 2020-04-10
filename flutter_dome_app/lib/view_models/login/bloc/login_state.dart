import 'package:meta/meta.dart';

@immutable
abstract class LoginState {
}

class InitialLoginState extends LoginState {
}

// ignore: must_be_immutable
class SuccessLoginState extends LoginState {}

class FailureLoginState extends LoginState {}