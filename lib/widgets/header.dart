import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeader extends StatelessWidget {
  // const AppHeader({Key? key}) : super(key: key);

  final db = FirebaseFirestore.instance;
  var docRef;

  AppHeader() {
    docRef = db.collection("Name").doc();
  }

  var name = FirebaseFirestore.instance.collection("products").snapshots();

  @override
  Widget build(BuildContext context) {
    return
        // Stack(
        //   children: [
        //     CustomPaint(
        //       painter: HeaderPainter(),
        //       size: const Size(double.infinity, 200),
        //     ),
        //     // Positioned(
        //     //   top: 20,
        //     //   left: 20,
        //     //   child: IconButton(
        //     //     onPressed: () {},
        //     //     icon: const Icon(
        //     //       Icons.menu,
        //     //       color: Colors.white,
        //     //     ),
        //     //   ),
        //     // ),
        //     const Positioned(
        //       top: 35,
        //       right: 40,
        //       child: CircleAvatar(
        //         minRadius: 25,
        //         maxRadius: 25,
        //      s   foregroundImage: AssetImage('assets/profile.jpg'),
        //       ),
        //     ),
        //     Positioned(
        //       left: 33,
        //       bottom: 20,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: const [
        //           Text(
        //             'Hello',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontWeight: FontWeight.w300,
        //               fontSize: 20,
        //             ),
        //           ),
        //           Text(
        //             'Michaele',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontWeight: FontWeight.bold,
        //               fontSize: 26,
        //             ),
        //           ),
        //         ],
        //       ),
        //     )
        //   ],s
        // ),
        Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.only(
            // bottomRight: Radius.circular(20),
            // bottomLeft: Radius.circular(20),
            ),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: CircleAvatar(
              backgroundColor: Colors.orange.shade100,
              radius: 42,
              // backgroundImage: AssetImage("images/avatar.webp"),
              child: Image.asset(
                "images/avatar.webp",
                fit: BoxFit.fitHeight,
                height: 67,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello',
                    style: GoogleFonts.montserrat(
                      // color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'ABHAY 👋',
                    style: GoogleFonts.acme(
                      // color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
              Text(
                'Track your healthy day now 📝',
                style: GoogleFonts.montserrat(
                  // color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              Text(
                'Become more fit 💪',
                style: GoogleFonts.montserrat(
                  // color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint backColor = Paint()..color = const Color(0xff18b0e8);
    Paint circles = Paint()..color = Colors.white.withAlpha(40);

    canvas.drawRect(
      Rect.fromPoints(
        const Offset(0, 0),
        Offset(size.width, size.height),
      ),
      backColor,
    );

    canvas.drawCircle(Offset(size.width * .65, 30), 20, circles);
    canvas.drawCircle(Offset(size.width * .50, 50), 10, circles);
    canvas.drawCircle(Offset(size.width * .60, 130), 10, circles);
    canvas.drawCircle(Offset(size.width - 10, size.height - 10), 20, circles);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
