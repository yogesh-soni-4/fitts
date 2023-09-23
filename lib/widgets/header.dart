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
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      // height :100,
      height: height * 0.15,
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
                // height: 67,
                height: height * 0.085,
              ),
            ),
          ),
          SizedBox(
            // width: 12,
            width: width * 0.019,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.,
            children: [
              SizedBox(
                // height: 15,
                height: height * 0.022,
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