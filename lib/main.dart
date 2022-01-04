import 'package:flutter/material.dart';
import 'package:shop_app/layout/shop_app/onBoarding/onBoarding_screen.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/shared/style/themes/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home:  OnBoardingScreen(),
    );
  }
}




