import 'package:flutter/material.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(), //commented cuz of routes
      //  home: loginPage(),
      routes: {
        "/": (context) => SignUpPage(),
        "/home": (context) => MyHomePage(),

        // myRoutes.loginRoute : (context) => LoginPage(),
        // myRoutes.homeRoute: (context) => MyHomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
