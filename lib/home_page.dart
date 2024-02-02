// ignore_for_file: prefer_const_constructors

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:seproject/routes.dart';
import 'package:seproject/user_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget departmentsList() {
    // use ListView.buildera() instead of row
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(height: 10),
        addDepartmentTiles("ECC"),
        SizedBox(width: 15),
        addDepartmentTiles("MVM"),
        SizedBox(width: 15),
        addDepartmentTiles("IMG"),
        SizedBox(width: 15),
        addDepartmentTiles("SSL"),
      ],
    );
  }

  Widget eventsList(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.73,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 5, // to be made dynamic
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: EdgeInsets.all(0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/demo_event.webp",
                        fit: BoxFit.scaleDown,
                        width: 400,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Talent Search",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("ECC, WPA",
                              style: TextStyle(fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Points: 3"),
                            TextButton(
                              onPressed: () {
                                // navigate to the ticket booking screen
                              },
                              child: Text("Book Ticket"),
                            )
                          ]),
                    ],
                  ),
                ),
              );
            }));

    // return Container(
    //     child: Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 20),
    //         child: Column(
    //           children: [
    //             Image.asset("assets/images/demo_event.webp"),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 Text("Talent Search",
    //                     style: TextStyle(fontWeight: FontWeight.bold)),
    //                 Text("ECC, WPA",
    //                     style: TextStyle(fontWeight: FontWeight.w300)),
    //               ],
    //             ),
    //             SizedBox(
    //               height: 10,
    //             )
    //           ],
    //         )));
    // return SizedBox(
    //     height: MediaQuery.of(context).size.height,
    //     child: ListView.builder(
    //       scrollDirection: Axis.vertical,
    //       itemCount: 10, // to be made dynamic
    //       itemBuilder: (BuildContext context, int index) {
    //         return Container(
    //             child: Column(
    //           children: [
    //             Image.asset("assets/images/demo_event.webp"),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 Text("Talent Search",
    //                     style: TextStyle(fontWeight: FontWeight.bold)),
    //                 Text("ECC, WPA",
    //                     style: TextStyle(fontWeight: FontWeight.w300)),
    //               ],
    //             ),
    //             SizedBox(height: 10,)
    //           ],
    //         ));
    //       },
    //     ));
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                  child: Column(
                children: [
                  SearchBar(
                    hintText: "Search for an event or department",
                    leading: Icon(Icons.search),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: departmentsList()),
                  SizedBox(height: 20),
                  // SingleChildScrollView(
                  //   child: eventsList(context),
                  // )
                ],
              )))),
      bottomNavigationBar: navbar(context, onNavBarTap, iconIndex),
    );
  }

  Widget addDepartmentTiles(departmentName) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, "/department_list");
      },
      child: Container(
          // height: 30,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              departmentName,
              style: TextStyle(fontSize: 18),
            ),
          )),
    );
  }
}
