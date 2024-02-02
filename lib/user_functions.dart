import 'package:flutter/material.dart';
import 'package:seproject/routes.dart';

Widget navbar(BuildContext context, Function(int) onNavbarTap, int iconIndex) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.shifting,
    backgroundColor: Colors.grey[200],
    unselectedItemColor: Colors.black54,
    selectedItemColor: Colors.purple,
    currentIndex: iconIndex,
    onTap: onNavbarTap,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(
        icon: Icon(Icons.event),
        label: "Events",
      ),
      BottomNavigationBarItem(icon: Icon(Icons.turned_in), label: "Tickets"),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
    ],
  );
}

// Widget previousTabButton(BuildContext context, String route) {
  
//   return BackButton(
//     onPressed: () {
    
    
//   );
// }

// class MyBottomNavigationBar extends StatefulWidget {
//   final int currentIndex;
//   final Function(int) onNavBarTap;
//   GlobalKey<_MyBottomNavigationBarState> bottomNavigationBarKey =
//     GlobalKey<_MyBottomNavigationBarState>();

//   MyBottomNavigationBar({
//     required this.currentIndex,
//     required this.onNavBarTap,
//   });

//   @override
//   _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
// }

// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

//   int iconIndex = 0;
//   void onNavBarTap(int index) {
//     setState(() {
//       iconIndex = index;
//     });
//     // switch (index) {
//     //   case 0:
//     //     // Navigate to Home Page
//     //     Navigator.pushReplacementNamed(context, Routes.homePage);

//     //     break;
//     //   case 1:
//     //     // Navigate to Events Page
//     //     Navigator.pushReplacementNamed(context, Routes.departments);
//     //     break;
//     // }
//   }

//   void rebuild() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(

//       type: BottomNavigationBarType.shifting,
//       backgroundColor: Colors.grey[200],
//       unselectedItemColor: Colors.black54,
//       selectedItemColor: Colors.purple,
//       onTap: widget.onNavBarTap,
//       currentIndex: widget.currentIndex,
//       items: [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//         BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
//         BottomNavigationBarItem(icon: Icon(Icons.turned_in), label: "Tickets"),
//         BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
//       ],
//     );
//   }
// }
