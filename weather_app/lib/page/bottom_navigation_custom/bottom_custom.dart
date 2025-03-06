import 'package:flutter/material.dart';
import 'package:weather_app/page/detail/detail_page.dart';
import 'package:weather_app/page/home/home_page.dart';

class BottomNavigationCustom extends StatefulWidget {
  const BottomNavigationCustom({super.key});

  @override
  State<BottomNavigationCustom> createState() => _BottomNavigationCustomState();
}

class _BottomNavigationCustomState extends State<BottomNavigationCustom> {
  List<BottomNavigationBarItem> listItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: "Home"),
    BottomNavigationBarItem(
      icon: Icon(Icons.list_rounded, size: 30),
      label: "List",
    ),
  ];

  List<Widget> listWidget = [HomePage(), DetailPage()];

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: listWidget[activePage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        backgroundColor: Colors.white30,
        elevation: 0,
        items: listItem,
        onTap: (index) {
          setState(() {
            activePage = index;
          });
        },
      ),
    );
  }
}
