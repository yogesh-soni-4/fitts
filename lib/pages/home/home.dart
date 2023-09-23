import 'package:fitts/widgets/activity.dart';
import 'package:fitts/widgets/current.dart';
import 'package:fitts/widgets/header.dart';
import 'package:fitts/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppHeader(),
            // CurrentPrograms(),
            RecentActivities(),
            BottomNavigation(),
            // SizedBox(height: 40,
            // )
          ],
        ),
      ),
    );
  }
}
