import 'package:brightminds/screens/pages/favourite_page.dart';
import 'package:brightminds/screens/pages/home_page.dart';
import 'package:brightminds/screens/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePAges(), // Replace with your screen widgets
    FavouritePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffB1CD61),
        selectedLabelStyle: TextStyle(color: Colors.black),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: _currentIndex == 0
                  ? Icon(
                      Icons.location_pin,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.location_pin,
                      color: Colors.grey,
                    )),
          BottomNavigationBarItem(
              label: "Saved",
              icon: _currentIndex == 1
                  ? Icon(
                      Icons.bookmark,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.bookmark,
                      color: Colors.grey,
                    )),
          BottomNavigationBarItem(
              label: "Profile",
              icon: _currentIndex == 2
                  ? Icon(
                      Icons.notifications,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.notifications,
                      color: Colors.grey,
                    )),
        ],
      ),
    );
  }
}
