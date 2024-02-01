import 'package:flutter/material.dart';
import 'package:seproject/routes.dart';
import 'package:seproject/user_functions.dart';

class Departments extends StatefulWidget {
  const Departments({Key? key}) : super(key: key);

  @override
  State<Departments> createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments> {
  final departments = {"ECC", "MVM", "IMG", "SSL"};
  int iconIndex = 0;
  void onNavBarTap(int index) {
    setState(() {
      iconIndex = index;
    });
    switch (index) {
      case 0:
        // Navigate to Home Page
        Navigator.pushReplacementNamed(context, Routes.homePage);

        break;
      case 1:

        // Navigate to Events Page
        Navigator.pushReplacementNamed(context, Routes.departments);
        break;
    }
  }

  // int
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 5),
        child: Material(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Align(
                alignment: Alignment.topLeft,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.homePage);
                  },
                  child: Icon(Icons.arrow_back_sharp),
                ),
              ),
              Text("DEPARTMENTS",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              addDepartment("ECC"),
              addDepartment("MVM"),
              addDepartment("IMG"),
              addDepartment("SSL"),
            ])),
      ),
      bottomNavigationBar: navbar(context, onNavBarTap, iconIndex),
    );
  }

  Widget addDepartment(String departmentName) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, "/department_list");
      },
      child: Container(
          height: 70,
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                departmentName,
                style: TextStyle(fontSize: 18),
              ),

              // SizedBox(width: 3),
              Icon(Icons.arrow_forward_ios)
            ],
          )),
    );
    // SizedBox(height: 15),
  }
}
