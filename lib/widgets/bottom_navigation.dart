import 'package:fitts/pages/home/home.dart';
import 'package:fitts/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:unicons/unicons.dart';

import '../pages/parent_page.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 12,
          left: 12,
          bottom: 12,
          top: 2,
        ),
        child: GNav(
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[300]!,
          gap: 8,
          activeColor: Colors.black,
          iconSize: 30,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          duration: Duration(milliseconds: 400),
          tabBackgroundGradient: LinearGradient(colors: [
            Color.fromARGB(255, 176, 234, 254),
            Color.fromARGB(255, 138, 224, 255),
          ]),
          color: Colors.black,
          tabs: [
            GButton(
              icon: UniconsLine.home_alt,
              iconSize: 30,
              text: 'Home',
              textStyle: GoogleFonts.acme(
                fontWeight: FontWeight.w600,
              ),
              onPressed: () => Get.to(() => MainPage()),
            ),
            GButton(
              icon: FontAwesomeIcons.search,
              text: 'Search',
              // onPressed:()=> Get.to(()=>HomePage()),
            ),
            GButton(
              icon: FontAwesomeIcons.heart,
              text: 'Like',
            ),
            GButton(
              icon: FontAwesomeIcons.user,
              text: 'Profile',
              // onPressed:()=> Get.to(()=>ParentPage()),
            ),
            GButton(
              icon: UniconsLine.setting,
              text: 'Settings',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
