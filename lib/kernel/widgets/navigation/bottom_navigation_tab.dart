import 'package:aplicacion_2/kernel/themes/colors_app.dart';
import 'package:flutter/material.dart';


class BottomNavigationTab extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const BottomNavigationTab({Key? key, required this.selectedIndex, required this.onItemTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home), 
          label: 'Home',),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configuration',),
      BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',),
    ],
    currentIndex: selectedIndex,
    selectedItemColor: ColorsApp.succesColor,
    unselectedItemColor: ColorsApp.primaryColor,
    onTap: onItemTapped,
    );
  }
}
