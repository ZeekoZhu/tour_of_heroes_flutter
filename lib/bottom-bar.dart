import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  BottomBar(int index) : this.index = index;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => _onItemTapped(i, context),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Heroes")
        ]);
  }

  void _onItemTapped(int value, BuildContext context) {
    var routes = {0: '/', 1: '/heroes'};
    Navigator.pushReplacementNamed(context, routes[value]);
  }
}
