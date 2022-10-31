import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/home/home_page.dart';

import '../../utils/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 2;
  static int _count = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      (index == 2)
          ? _BottomNavBarState._count++
          : _BottomNavBarState._count = 0;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const Text("Share"),
    const Text("Search"),
    const HomePage(),
    const Text("Profile"),
    const Text("Settings")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        iconSize: 32,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.iconLight,
        unselectedItemColor: AppColors.iconDark,
        selectedLabelStyle: const TextStyle(fontSize: 10, height: 1.5),
        unselectedLabelStyle: const TextStyle(fontSize: 10, height: 1.5),
        items: [
          const BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_share_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_share_filled),
              label: "Share"),
          const BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              label: "Search"),
          BottomNavigationBarItem(
              icon: const Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: GestureDetector(
                  onTap: () {
                    print("Hello");
                  },
                  child: const Icon(
                      FluentSystemIcons.ic_fluent_add_circle_regular)),
              label: (_selectedIndex != 2) ? "Home" : "Add"),
          const BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: "Profile"),
          const BottomNavigationBarItem(
              icon:
                  Icon(FluentSystemIcons.ic_fluent_settings_regular, size: 28),
              activeIcon:
                  Icon(FluentSystemIcons.ic_fluent_settings_filled, size: 28),
              label: "Settings"),
        ],
      ),
    );
  }
}
