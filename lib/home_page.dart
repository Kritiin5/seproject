// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Navigation Bar"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text(
          "Home Page",
          style: TextStyle(
            fontSize: 45,
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}