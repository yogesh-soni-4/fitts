import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitts/pages/parent_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/parent_form_app_bar.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _weightController = TextEditingController();
  final _bpController = TextEditingController();
  final _exDurController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  int w = 0;
  int b = 0;
  int e = 0;

  var ts;
  DateTime current_time = DateTime.now();

  Future<void> uploadData(int weight, int bp, int excDur) async {
    await FirebaseFirestore.instance
        .collection("Report")
        .doc(current_time.toString().substring(0, 11))
        .set({
      'Weight': weight,
      'BP': bp,
      'Excercise_duration': excDur,
      'Timestamp': ts,
    });
  }

  List<Item> items = [];

  var userData;

  Future<void> fetchItems() async {
    await FirebaseFirestore.instance
        .collection('collection_name')
        .where(FieldPath.documentId,
            isEqualTo: current_time.toString().substring(0, 11))
        .get()
        .then((event) {
      if (event.docs.isNotEmpty) {
        Map<String, dynamic> documentData =
            event.docs.single.data(); //if it is a single document
      }
      // ignore: invalid_return_type_for_catch_error
    }).catchError((e) => print("error fetching data: $e"));
  }

  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: ParentFormAppBar(appBar: AppBar()),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                top: 5,
                bottom: 3,
              ),
              child: Text(
                "Hey there 👋... Good to see you back",
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                // top: 5,
                bottom: 10,
              ),
              child: Text(
                "Tell us how was your another healthy day ?",
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 40,
              ),
              child: Row(
                children: [
                  Text(
                    "Weight",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val == null) return 'Enter your weight';
                      },
                      maxLength: 10,
                      controller: _weightController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple.shade200, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        floatingLabelStyle: GoogleFonts.montserrat(
                            color: Colors.black, fontWeight: FontWeight.w600),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple[100]!, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        counterText: "",
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                        label: const Text("(in KG's)"),
                        labelStyle: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                      onChanged: (value) {
                        setState(() {
                          w = int.parse(value);
                          ts = FieldValue.serverTimestamp();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 30,
              ),
              child: Row(
                children: [
                  Text(
                    "Blood\nPressure",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val == null) return 'Enter your BP';
                      },
                      maxLength: 10,
                      controller: _bpController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple.shade200, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        floatingLabelStyle: GoogleFonts.montserrat(
                            color: Colors.black, fontWeight: FontWeight.w600),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple[100]!, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        counterText: "",
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                        label: const Text("(in mmHg)"),
                        labelStyle: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                      onChanged: (value) {
                        setState(
                          () {
                            b = int.parse(value);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 25,
              ),
              child: Row(
                children: [
                  Text(
                    "Exercise\nDuration",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: TextFormField(
                      validator: (val) {
                        if (val == null) return 'Enter your exercise duration';
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      controller: _exDurController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple.shade200, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        floatingLabelStyle: GoogleFonts.montserrat(
                            color: Colors.black, fontWeight: FontWeight.w600),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple[100]!, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        counterText: "",
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                        label: const Text("(in Minutes)"),
                        labelStyle: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                      ),
                      onChanged: (value) {
                        setState(() {
                          e = int.parse(value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Center(
                child: Container(
                  height: 40,
                  width: 131,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 107, 230, 255)!,
                      Color.fromARGB(255, 107, 230, 255)!,
                      // Color.fromARGB(255, 188, 224, 254)!,
                      // Colors.red[200]!,
                    ]),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 2,
                        color: Colors.black12,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Submit Data ",
                        style: GoogleFonts.acme(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 5, 53, 93)),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Icon(
                        FontAwesomeIcons.circleCheck,
                        color: Color.fromARGB(255, 60, 60, 255),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Get.defaultDialog(
                  title: "Are you sure that the information is correct?",
                  middleText:
                      "Confirming this will update the data for today's health report.",
                  textConfirm: "YES",
                  textCancel: "NO",
                  buttonColor: Color.fromARGB(255, 4, 55, 97),
                  backgroundColor: Colors.teal.shade200,
                  titleStyle: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  middleTextStyle: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  radius: 30,
                  onConfirm: () {
                    uploadData(w, b, e
                        // DateTime.now()
                        );
                    Get.to(() => ParentPage());
                  },
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 365,
                    width: 300,
                    child: Image.asset("images/water.png"),
                  ),
                  Positioned(
                    left: 90,
                    top: 130,
                    child: CustomPaint(
                      painter: HeaderPainter(),
                      size: const Size(100, 200),
                    ),
                  ),
                  Positioned(
                    child: Text(
                      "Stay\nHyderated\n⭐",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                    left: 88,
                    top: 210,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//   _confirmFunction() async {
//     // print("done");
//     uploadData(
//         int.parse(_weightController.value.toString()),
//         int.parse(_bpController.value.toString()),
//         int.parse(_exDurController.value.toString()),
//         // serverTimestamp()()
//         );
//     Get.to(() => ParentPage());
//   }
}

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint backColor = Paint()..color = Colors.transparent;
    Paint circles = Paint()..color = Colors.white.withAlpha(40);

    canvas.drawRect(
      Rect.fromPoints(
        const Offset(0, 0),
        Offset(size.width, size.height),
      ),
      backColor,
    );

    canvas.drawCircle(Offset(size.width * .9, 80), 15, circles);
    canvas.drawCircle(Offset(size.width * .50, 20), 10, circles);
    canvas.drawCircle(Offset(size.width * .60, 150), 10, circles);
    canvas.drawCircle(Offset(size.width - 10, size.height - 10), 20, circles);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Item {
  final String name;
  final String description;

  Item({required this.name, required this.description});

  // Factory constructor to create an Item object from a map
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }
}
