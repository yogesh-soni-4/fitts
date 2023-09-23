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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 213,
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
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Choose the user mode',
                  style: GoogleFonts.sanchez(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 6,
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
              children: [
                GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
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
                                fontWeight: FontWeight.w500,
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
                          height: 120,
                          width: 120,
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
                              fontWeight: FontWeight.w500,
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

// class Program extends StatelessWidget {
//   final FitnessProgram program;
//   final bool active;
//   final Function(ProgramType) onTap;

//   const Program({
//     Key? key,
//     required this.program,
//     this.active = false,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onTap(program.type);
//       },
//       child: Container(
//         height: 100,
//         width: 180,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           image: DecorationImage(
//             colorFilter: ColorFilter.mode(
//               active
//                   ? const Color(0xff1ebdf8).withOpacity(.8)
//                   : Colors.white.withOpacity(.8),
//               BlendMode.lighten,
//             ),
//             image: program.image,
//             fit: BoxFit.cover,
//           ),
//         ),
//         alignment: Alignment.bottomLeft,
//         padding: const EdgeInsets.all(15),
//         child: DefaultTextStyle.merge(
//           style: TextStyle(
//             color: active ? Colors.white : Colors.black,
//             fontSize: 10,
//             fontWeight: FontWeight.w500,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(program.name),
//               Row(
//                 children: [
//                   // Text(program.cals),
//                   const SizedBox(width: 15),
//                   Icon(
//                     Icons.timer,
//                     size: 10,
//                     color: active ? Colors.white : Colors.black,
//                   ),
//                   const SizedBox(width: 5),
//                   // Text(program.time),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
