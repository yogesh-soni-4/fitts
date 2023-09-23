import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitts/models/health_trackers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Stats extends StatefulWidget {
  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  // const Stats({Key? key}) : super(key: key);
  // Map<String, int> items = {
  //   'Weight': 50,
  //   "BP": 100,
  //   "Ex": 100,
  // };

  // var userData;
  // late Map<String, dynamic> documentData;

  DateTime current_time = DateTime.now();

  Future<void> fetchItems() async {
    // userData = FirebaseFirestore.instance
    //     .collection('Report')
    //     .doc(current_time.toString().substring(0, 11))
    //     .snapshots();
    // print(userData);
    // await FirebaseFirestore.instance
    //     .collection('collection_name')
    //     .where(FieldPath.documentId,
    //         isEqualTo: current_time.toString().substring(0, 11))
    //     .get()
    //     .then((event) {
    //   if (event.docs.isNotEmpty) {
    //     documentData = event.docs.single.data(); //if it is a single document
    //   }
    // }).catchError((e) => print("error fetching data: $e"));

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

  // @override
  // void initState() {
  //   super.initState();
  //   fetchItems();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 30),
        //   child: Row(
        //     children: const [
        //       Text(
        //         'Workout Stats',
        //         style: TextStyle(
        //           fontSize: 14,
        //           fontWeight: FontWeight.w800,
        //         ),
        //       ),
        //       SizedBox(width: 8),
        //       Icon(
        //         Icons.bar_chart,
        //         size: 20,
        //         color: Color.fromARGB(255, 169, 96, 96),
        //       ),
        //     ],
        //   ),
        // ),
        // const SizedBox(height: 5),
        // StreamBuilder<DocumentSnapshot>(
        //   stream: FirebaseFirestore.instance
        //       .collection('Report')
        //       .doc(selected_date.toString().substring(0, 11))
        //       .snapshots(),
        //   builder: (context, snapshot) {
        //     String d = selected_date.toString().substring(0, 11);
        //     if (!snapshot.hasData) {
        //       return CircularProgressIndicator();
        //     }
        //     if (!snapshot.data!.exists) {
        //       return Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 48.0),
        //         child: Container(
        //           height: 110,
        //           child: Center(
        //             child: Text(
        //               textAlign: TextAlign.center,
        //               'No data available for data $d ⚠️',
        //               style: GoogleFonts.montserrat(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w400,
        //                   color: Colors.red),
        //             ),
        //           ),
        //         ),
        //       );
        //     }

        //     var data = snapshot.data!.data() as Map<String, dynamic>;

        //     items = Item(
        //       w: data['Weight'],
        //       b: data['BP'],
        //       x: data['Excercise_duration'],
        //     );

        //     return Row(
        //       children: [
        //         SizedBox(width: 15),
        //         InfoStat(
        //           icon: Icons.bolt,
        //           iconColor: Color.fromARGB(255, 255, 179, 0),
        //           iconBackground: Color.fromARGB(255, 200, 253, 202),
        //           time: '+5s',
        //           label: 'Exercise Duration',
        //           value: items.x.toString(),
        //         ),
        //         SizedBox(width: 15),
        //         InfoStat(
        //           icon: FontAwesomeIcons.weightScale,
        //           iconColor: Color(0xff535bed),
        //           iconBackground: Color(0xffe4e7ff),
        //           time: '+5s',
        //           label: 'Weight',
        //           value: items.w.toString() + " KG",
        //         ),
        //         SizedBox(width: 15),
        //         InfoStat(
        //           icon: Icons.favorite_outline,
        //           iconColor: Color(0xffe11e6c),
        //           iconBackground: Color(0xffffe4fb),
        //           time: '+5s',
        //           label: 'Blood Pressure',
        //           value: items.b.toString() + " mmHg",
        //         ),
        //         SizedBox(width: 15),
        //       ],
        //     );
        //   },
        // )
      ],
    );
  }
}

class InfoStat extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String time;
  final String label;
  final String value;

  const InfoStat({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.time,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xffe1e1e1),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(3, 3),
              blurRadius: 3,
            ),
          ]),
      child: Stack(
        children: [
          StatIcon(
            icon: icon,
            iconColor: iconColor,
            iconBackground: iconBackground,
          ),
          Change(time: time),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 10),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Change extends StatelessWidget {
  const Change({
    Key? key,
    required this.time,
  }) : super(key: key);

  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(500),
        ),
        child: Text(
          time,
          style: const TextStyle(fontSize: 10, color: Colors.white),
        ),
      ),
    );
  }
}

class StatIcon extends StatelessWidget {
  const StatIcon({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: iconBackground,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Icon(icon, size: 21, color: iconColor),
    );
  }
}
