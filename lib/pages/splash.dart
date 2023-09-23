import 'dart:async';
import 'package:fitts/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Get.to(() => MainPage());
    /* Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));*/
  }

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 440,
                ),
                Center(
                  child: Text(
                    "Healthier Together,\nHappier Forever 🙌",
                    style: GoogleFonts.acme(fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Fueling Healthy Habits,\nTogether 💪",
                    style: GoogleFonts.acme(fontSize: 24),
                  ),
                ),
                Spacer(),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "A PRODUCT OF ACME COMPANY LTD.",
                    style: GoogleFonts.montserrat(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                // Padding(
                //     padding: const EdgeInsets.only(bottom: 30.0),
                //     child: Image.asset(
                //       'images/l.gif',
                //       height: 150.0,
                //       // fit: BoxFit.scaleDown,
                //     )),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Image.asset(
                    'images/heart.gif',
                    // width: animation.value * 250,
                    height: 259.0,
                  ),
                  // Image.asset(
                  //   'images/heart.gif',
                  //   width: 100,
                  //   height: 100,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
