import 'package:fitts/widgets/activity.dart';
import 'package:fitts/widgets/choice.dart';
import 'package:fitts/widgets/current.dart';
import 'package:fitts/widgets/header.dart';
import 'package:fitts/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            AppHeader(),
            // CurrentPrograms(),
            ChoicePage(),
            RecentActivities(),
            // Spacer(),
            BottomNavigation(),
            // SizedBox(height: 45,)
          ],
        ),
      ),
    );
  }
}
