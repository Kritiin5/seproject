// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'routes.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController uidController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isButtonClicked = false;
  bool valid = false;
  bool btnChange = false;
  bool user = false;
  bool pwd = false;
  bool isPwdVisible = false;
  bool isConfirmPwdVisible = false;

  bool signUp = false;
  bool forgotPwd = false;
  String errorMsg = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let's get started!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
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

                  SizedBox(height: 30.0),
                  // name
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter name";
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Name",
                        prefixIcon: Icon(Icons.person_3_outlined)),
                  ),
                  SizedBox(height: 20.0),
                  // email id
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email field can't be empty";
                      }
                      bool isEmailValid = RegExp(
                        r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
                      ).hasMatch(value);

                      if (!isEmailValid) {
                        return "Please enter valid email";
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Email",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Uid Input
                  TextFormField(
                      controller: uidController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Uid field can't be empty";
                        }

                        if (value.length > 7) {
                          return "Please enter valid UID";
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter UID",
                          prefixIcon: Icon(Icons.person))),
                  SizedBox(height: 20.0),
                  // password
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password field can't be empty";
                      }
                      if (value.length < 4) {
                        return "Password should have minimum 4 characters";
                      }
                    },
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
                  // confirm password
                  TextFormField(
                    obscureText: isConfirmPwdVisible ? false : true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Kindly confirm password";
                      } else if (passwordController.text != value) {
                        return "Password is not matching";
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Confirm Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isConfirmPwdVisible = !isConfirmPwdVisible;
                          });
                        },
                        child: Icon(isConfirmPwdVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),

                  SizedBox(height: 30.0),
                  Material(
                    borderRadius: BorderRadius.circular(35),
                    // color: Colors.deepPurple[700],
                    color: Colors.black87,
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          isButtonClicked = true;
                        });

                        await Future.delayed(Duration(seconds: 3));

                        if (_formKey.currentState!.validate()) {
                          valid = true;
                          print("name: ${nameController.text}");
                          print("Password: ${passwordController.text}");
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: TextStyle(fontSize: 16)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.loginPage);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 16),
                        ),
                        // ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: isButtonClicked,
                    child: Text(
                      valid
                          ? "Account created successfully"
                          : "Kindly fill all the fields", // ERROR: error msg is null everytime
                      style: TextStyle(
                          color: valid ? Colors.green : Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
        ),
      ),
    ));
  }
}
