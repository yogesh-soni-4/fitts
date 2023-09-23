import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitts/helpers.dart';
import 'package:fitts/models/health_trackers.dart';
import 'package:fitts/widgets/stats.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Dates extends StatefulWidget {
  const Dates({
    Key? key,
  }) : super(key: key);

  @override
  State<Dates> createState() => _DatesState();
}

class _DatesState extends State<Dates> {
  List<DateBox> dateBoxes = [];
  int activeDay = DateTime.now().weekday;

  void dayone() {
    setState(() {
      dateBoxes = [];
      activeDay = 1;
    });
  }

  void daytwo() {
    setState(() {
      dateBoxes = [];
      activeDay = 2;
    });
  }

  void daythree() {
    setState(() {
      dateBoxes = [];
      activeDay = 3;
    });
  }

  void dayfour() {
    setState(() {
      dateBoxes = [];
      activeDay = 4;
    });
  }

  void dayfive() {
    setState(() {
      dateBoxes = [];
      activeDay = 5;
    });
  }

  void daysix() {
    setState(() {
      dateBoxes = [];
      activeDay = 6;
    });
  }

  void dayseven() {
    setState(() {
      dateBoxes = [];
      activeDay = 7;
    });
  }

  @override
  Widget build(BuildContext context) {
    // DateTime date = DateTime.now().subtract(const Duration(days: 3));
    DateTime date =
        DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
    for (int i = 1; i < 8; i++) {
      dateBoxes.add(DateBox(
        date: date,
        activeday: activeDay,
        changeDay: date.weekday == 1
            ? dayone
            : date.weekday == 2
                ? daytwo
                : date.weekday == 3
                    ? daythree
                    : date.weekday == 4
                        ? dayfour
                        : date.weekday == 5
                            ? dayfive
                            : date.weekday == 6
                                ? daysix
                                : dayseven,
      ));
      date = date.add(const Duration(days: 1));
    }
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: dateBoxes,
            )),
        StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Report')
              .doc(selected_date.toString().substring(0, 11))
              .snapshots(),
          builder: (context, snapshot) {
            String d = selected_date.toString().substring(0, 11);
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            if (!snapshot.data!.exists) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Container(
                  height: 110,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'No statistics available for data $d ⚠️',
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.red),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Add statistics 📊',
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            var data = snapshot.data!.data() as Map<String, dynamic>;

            items = Item(
              w: data['Weight'],
              b: data['BP'],
              x: data['Excercise_duration'],
            );

            return Row(
              children: [
                SizedBox(width: 15),
                InfoStat(
                  icon: Icons.bolt,
                  iconColor: Color.fromARGB(255, 255, 179, 0),
                  iconBackground: Color.fromARGB(255, 200, 253, 202),
                  time: '+5s',
                  label: 'Exercise Duration',
                  value: items.x.toString(),
                ),
                SizedBox(width: 15),
                InfoStat(
                  icon: FontAwesomeIcons.weightScale,
                  iconColor: Color(0xff535bed),
                  iconBackground: Color(0xffe4e7ff),
                  time: '+5s',
                  label: 'Weight',
                  value: items.w.toString() + " KG",
                ),
                SizedBox(width: 15),
                InfoStat(
                  icon: Icons.favorite_outline,
                  iconColor: Color(0xffe11e6c),
                  iconBackground: Color(0xffffe4fb),
                  time: '+5s',
                  label: 'Blood Pressure',
                  value: items.b.toString() + " mmHg",
                ),
                SizedBox(width: 15),
              ],
            );
          },
        )
      ],
    );
  }
}

class DateBox extends StatefulWidget {
  // final bool active;
  final DateTime date;
  final int activeday;
  final Function changeDay;

  const DateBox({
    Key? key,
    // this.active,
    required this.activeday,
    required this.date,
    required this.changeDay,
  }) : super(key: key);

  @override
  State<DateBox> createState() => _DateBoxState();
}

class _DateBoxState extends State<DateBox> {
  Future<void> fetchItems(DateTime date) async {
    await FirebaseFirestore.instance
        .collection("Report")
        .doc(date.toString().substring(0, 11))
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

  @override
  void initState() {
    super.initState();
    fetchItems(widget.date);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 43,
        height: 66,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        decoration: BoxDecoration(
          gradient: widget.date.weekday == widget.activeday
              ? const LinearGradient(colors: [
                  Color(0xff92e2ff),
                  Color(0xff1ebdf8),
                ], begin: Alignment.topCenter)
              : null,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xffe1e1e1),
          ),
        ),
        child: DefaultTextStyle.merge(
          style: widget.date.weekday == widget.activeday
              ? const TextStyle(color: Colors.white)
              : null,
          child: Column(
            children: [
              Text(
                daysOfWeek[widget.date.weekday]!,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(height: 0),
              Text(widget.date.day.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
      ),
      onTap: () {
        // fetchItems(widget.date);
        // func();
        setState(() {
          selected_date = widget.date;
          // widget.active = true;
          widget.changeDay();
          // Stats();
        });
      },
    );
  }
}
