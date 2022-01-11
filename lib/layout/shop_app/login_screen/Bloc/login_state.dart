part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final ShopLoginModel shopLoginModel;

  LoginSuccess(this.shopLoginModel);
}

class LoginLoading extends LoginState {}

class ShowVisibilityState extends LoginState {}

class LoginError extends LoginState {
  final String error;
  LoginError(this.error);
}
