import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitts/models/health_trackers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  int w = 0;
  int b = 0;
  int e = 0;
  // var d = selected_date.toString().substring(0, 11);
  var ts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: IconButton(
        onPressed: () => showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(
              textAlign: TextAlign.center,
              "Edit statistics for date ${selected_date.toString().substring(0, 11)}",
              style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            content: Container(
              height: 155.0,
              width: 150,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Weight",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        SizedBox(
                          height: 40,
                          width: 120,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val == null) return 'Enter your weight';
                            },
                            maxLength: 10,
                            // controller: _weightController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple.shade200,
                                    width: 2),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                              ),
                              floatingLabelStyle: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
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
                                  fontSize: 12,
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
                      vertical: 5,
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Blood\nPressure",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        SizedBox(
                          height: 40,
                          width: 120,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val == null) return 'Enter your BP';
                            },
                            maxLength: 10,
                            // controller: _bpController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple.shade200,
                                    width: 2),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                              ),
                              floatingLabelStyle: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
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
                                  fontSize: 12,
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
                      vertical: 5,
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Exercise\nDuration",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        SizedBox(
                          height: 40,
                          width: 120,
                          child: TextFormField(
                            validator: (val) {
                              if (val == null)
                                return 'Enter your exercise duration';
                            },
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            // controller: _exDurController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple.shade200,
                                    width: 2),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                              ),
                              floatingLabelStyle: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
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
                                  fontSize: 12,
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
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  uploadData(w, b, e
                      // DateTime.now()
                      );
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 224, 181, 253),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(4, 4),
                          blurRadius: 5,
                        ),
                      ]),
                  child: Text(
                    "Save",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      // color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        icon: Icon(
          FontAwesomeIcons.edit,
        ),
      ),
    );
  }

  Future<void> uploadData(int weight, int bp, int excDur) async {
    await FirebaseFirestore.instance
        .collection("Report")
        .doc(selected_date.toString().substring(0, 11))
        .set({
      'Weight': weight,
      'BP': bp,
      'Excercise_duration': excDur,
      'Timestamp': ts,
    });
  }
}
