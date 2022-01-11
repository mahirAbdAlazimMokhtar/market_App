import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/shop_app/login_model.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/network/remote/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  //first thing you want to take object from cubit by using this way
  static LoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;
  ShopLoginModel? shopLoginModel;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    suffix = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ShowVisibilityState());
  }

//this method for user login
  // the login have 3 states 1- onLoading 2- OnSuccess 3- OnError
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoading());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      shopLoginModel = ShopLoginModel.fromJason(value.data);
      if (kDebugMode) {
        print(shopLoginModel?.data);
      }
      emit(LoginSuccess(shopLoginModel!));
      // ignore: avoid_print
      return print(value.data);
    }).catchError(
      (error) {
        if (kDebugMode) {
          print(
            error.toString(),
          );
        }
        emit(
          LoginError(
            error.toString(),
          ),
        );
      },
    );
  }
}
