import 'package:meta/meta.dart';

@immutable
abstract class LoginState {
}

class InitialLoginState extends LoginState {
}

class SuccessLoginState extends LoginState {}

class FailureLoginState extends LoginState {}