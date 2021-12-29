import 'package:flutter/material.dart';
import 'package:shop_app/layout/shop_app/register_screen/register_screen.dart';
import 'package:shop_app/shared/component/component.dart';

class ShopLoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.black,
                  ),
                ),
                Text(
                  'login no to browse our hot offers',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.grey),
                ),
                space(height: 30.0),
                defaultFormField(
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'PlZ enter your email';
                    }
                  },
                  labelText: 'Email',
                  prefixIcon: Icons.email_outlined,
                ),
                space(height: 15.0),
                defaultFormField(
                  controller: passwordController,
                  inputType: TextInputType.visiblePassword,
                  suffixIcon: Icons.visibility_outlined,
                  suffixPressed: () {},
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'your password is too short';
                    }
                  },
                  labelText: 'Password',
                  prefixIcon: Icons.lock_outlined,
                ),
                space(height: 30.0),
                defaultButton(
                  function: () {},
                  text: 'Login',
                  isUpperCase: true,
                ),
                space(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                  const Text("Don't have an account ?"),
                  defaultTextButton(title: 'Register now', onPressed: (){
                    navigateTo(context, const RegisterScreen());
                  })
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
