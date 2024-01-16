// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'home_page.dart';
import 'routes.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController uidcontroller = TextEditingController();

  bool isButtonClicked = false;
  bool valid = false;
  bool btnChange = false;
  bool user = false;
  bool pwd = false;
  bool isPwdVisible = false;
  bool signUp = false;
  bool forgotPwd = false;
  String errorMsg = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let's get started!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    "Create an account to book tickets",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20.0,
                    ),
                  ),

                  SizedBox(height: 40.0),
                  // name
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Name",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // email id
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Email",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Uid Input
                  TextFormField(
                    controller: uidcontroller,
                    validator: (value) {
                      if (value == null || value == value.isEmpty) {
                        // valid = false;
                        errorMsg = "Username can\'t be empty";
                        return errorMsg;
                      } else {
                        valid = true;
                        errorMsg = '';
                        return errorMsg;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter UID",
                        prefixIcon: Icon(Icons.perm_identity_outlined)),
                  ),
                  SizedBox(height: 20.0),
                  // password
                  TextFormField(
                    controller: passwordController,
                    obscureText: isPwdVisible ? false : true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPwdVisible = !isPwdVisible;
                          });
                        },
                        child: Icon(isPwdVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isPwdVisible ? false : true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Confirm Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPwdVisible = !isPwdVisible;
                          });
                        },
                        child: Icon(isPwdVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.verifyAcc);
                    },
                    child: Text("Forgot Password?"),
                  ),

                  SizedBox(height: 30.0),
                  Material(
                    borderRadius: BorderRadius.circular(35),
                    // color: Colors.deepPurple[700],
                    color: Colors.black87,
                    child: InkWell(
                      onTap: () async {
                        // async
                        setState(() {
                          isButtonClicked = true;
                          // right now used the or operator but later on
                          // if (usernameController.text.isNotEmpty ||
                          //     passwordController.text.isNotEmpty) {
                          //   print("Username: ${usernameController.text}");
                          //   print("Password: ${passwordController.text}");
                          //   valid = true;
                          // } else if (usernameController.text.isEmpty) {
                          //   user = false;
                          // } else if (passwordController.text.isEmpty) {
                          //   pwd = false;
                          // }
                          if (_formKey.currentState!.validate()) {
                            print('budyy');
                          }
                        });

                        await Future.delayed(Duration(seconds: 5));
                        // if (isButtonClicked && valid)
                        await Navigator.pushReplacementNamed(
                          context,
                          Routes.homeRoute,
                        );
                        if (_formKey.currentState!.validate()) {
                          // if (valid){
                          errorMsg =
                              _formKey.currentState!.validate() as String;
                          // valid = true;
                          print("email: ${usernameController.text}");
                          print("Password: ${passwordController.text}");
                          print(errorMsg);
                        }
                        setState(() {
                          isButtonClicked = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 50.0,
                        width: isButtonClicked && valid ? 50.0 : 100.0,
                        alignment: Alignment.center,

                        child: isButtonClicked && valid
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text("Create",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),

                        // decoration: BoxDecoration(
                        //     color: Colors.purple[700]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Visibility(
                    visible: isButtonClicked,
                    child: Text(
                      valid
                          ? "${usernameController.text} logging in..."
                          : errorMsg, // ERROR: error msg is null everytime
                      style:
                          TextStyle(color: valid ? Colors.green : Colors.red),
                    ),
                  ),
                  Text("Don't have an account?"),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.signUp,
                        );
                      });
                    },
                    // child: AnimatedContainer(
                    //   duration: Duration(seconds: 1),
                    //   curve: Curves.easeInOut,
                    child: Text("Sign Up"),
                    // ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
