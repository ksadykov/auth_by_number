part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSucces extends AuthState {
  final Modelphone model;
  AuthSucces({required this.model});
}

class AuthCodeSucces extends AuthState {
  final Modelcode model;
  AuthCodeSucces({required this.model});
}

class AuthError extends AuthState {
  final String? errorMasseges;
  AuthError({required this.errorMasseges});
}
