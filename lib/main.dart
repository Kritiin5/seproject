import 'package:flutter/material.dart';
import 'package:seproject/reset_password.dart';
import 'package:seproject/splash_screen.dart';
import 'package:seproject/verification_page.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'signup.dart';
import "routes.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
      ),
      routes: {
        // "/" : (context) => VerificationPage(),
        Routes.splashScreen: (context) => SplashScreen(),
        Routes.signUp: (context) => SignUpPage(),
        Routes.loginPage: (context) => LoginPage(),
        Routes.homePage: (context) => HomePage(),
        Routes.verifyAccount: (context) => VerificationPage(),
        Routes.resetPassword: (context) => ResetPasswordPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
