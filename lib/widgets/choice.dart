// import 'package:fitts/models/choice_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitts/models/fitness_program.dart';
import 'package:fitts/models/health_trackers.dart';
import 'package:fitts/pages/child_page.dart';
import 'package:fitts/pages/parent_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  State<ChoicePage> createState() => _CurrentProgramsState();
}

class _CurrentProgramsState extends State<ChoicePage> {
  ProgramType active = ChoiceBoxs[0].type;

  void _changeProgram(ProgramType newType) {
    setState(() {
      active = newType;
    });
  }

  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      // height: 213,
      height: height * 0.29,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 194, 236, 255),
            Color.fromARGB(255, 237, 249, 255),
          ],
        ),
        // color: Color.fromARGB(255, 237, 249, 255),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              // vertical: 10,
              vertical: height * 0.015,
              // horizontal: 30,
              horizontal: height * 0.065,
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Choose the user mode',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  // width: 6,
                  width: width * 0.006,
                ),
                const Icon(
                  Icons.person,
                  size: 30,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        children: [
                          Container(
                            // height: 120,
                            height: height * 0.16,
                            // width: 120,
                            width: width * 0.34,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple[100],
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(5, 5),
                                      blurRadius: 7,
                                      spreadRadius: 5)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "images/parent.png",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Parent",
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selected_date = DateTime.now();
                        Get.to(() => ParentPage());
                      });
                    }),
                // SizedBox(
                //   width: 10,
                // ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      children: [
                        Container(
                          // height: 120,
                          height: height * 0.16,
                          // width: 120,
                          width: width * 0.35,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[100],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                    spreadRadius: 5)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 0, left: 8, right: 8),
                            child: Image.asset(
                              "images/child.png",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Child",
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selected_date = DateTime.now();
                      Get.to(() => ChildPage());
                    });
                  },
                  // onTap: () => Get.to(() => ItemListScreen()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> fetchItems() async {
    await FirebaseFirestore.instance
        .collection("Report")
        .doc(selected_date.toString().substring(0, 11))
        .snapshots()
        .listen((event) {
      setState(() {
        dataa["Weight"] = event.get("Weight");
        dataa["BP"] = event.get("BP");
        dataa["Ex"] = event.get("Excercise_duration");
        // print(documentData);
      });
    });
  }
}

