import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {}


class LoginCredentials extends LoginEvent {
  final String account;
  final String password;

  LoginCredentials({@required this.account,@required this.password});
}