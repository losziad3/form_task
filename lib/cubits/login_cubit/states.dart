import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState {}

class AuthInitial extends LoginState {}

class AuthLoading extends LoginState {}

class AuthSuccess extends LoginState {
  final User user;
  AuthSuccess(this.user);
}

class AuthFailure extends LoginState {
  final String error;
  AuthFailure(this.error);
}
