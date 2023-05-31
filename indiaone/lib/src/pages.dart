import 'package:flutter/material.dart';
import 'package:indiaone/src/screens/home_screen/home_screen.dart';

class Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;

    final pages = [
      HomeScreen()
    ];

    return Scaffold(
      body: pages[pageIndex],
    );
  }
}
