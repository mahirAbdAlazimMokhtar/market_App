import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/login_screen/Bloc/login_cubit.dart';

import 'package:shop_app/layout/shop_app/register_screen/register_screen.dart';
import 'package:shop_app/shared/component/component.dart';

class ShopLoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  static var formKey = GlobalKey<FormState>();

  ShopLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            Text(
                              'Login no to browse our hot offers',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: Colors.grey),
                            ),
                            space(height: 30.0),
                            defaultFormField(
                              context: context,
                              label: 'Email Address',
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Email is too shore';
                                }
                              },
                              controller: emailController,
                              prefix: Icons.email,
                            ),
                            space(height: 30.0),
                            // buildPasswordTextFormField(context),
                            defaultFormField(
                              context: context,
                              isPassword: !LoginCubit.get(context).isPasswordShown ? true : false,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'password must not be empty';
                                }
                              },
                              onSubmit: (value) {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              suffix: LoginCubit.get(context).suffix,
                              label: 'password',
                              suffixPressed: () {
                                LoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              controller: passwordController,
                              prefix: Icons.lock,
                            ),
                            space(height: 20.0),
                            BuildCondition(
                              fallback: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              condition: state is! LoginLoading,
                              builder: (context) => Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: MaterialButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      LoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    }
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            space(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account ?"),
                                TextButton(
                                    onPressed: () {
                                      navigateTo(
                                          context, const RegisterScreen());
                                    },
                                    child: const Text("Register Now"))
                              ],
                            )
                          ]),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
