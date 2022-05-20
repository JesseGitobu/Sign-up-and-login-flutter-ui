import 'package:flutter/material.dart';
import 'package:signup_ui_backend/Splash _Screen/Screens/splash screen.dart';
import 'package:signup_ui_backend/sign_up/signup_screen.dart';
import 'package:signup_ui_backend/log_in/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    routes: {
      LoginScreen.routeName: (ctx) => LoginScreen(),
      SignupScreen.routeName: (ctx) => SignupScreen(),
    }
    );
  }
}

