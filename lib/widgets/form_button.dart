import 'package:fitts/pages/form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class FormButton extends StatefulWidget {
  const FormButton({super.key});

  @override
  State<FormButton> createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 40,
        width: 142.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 138, 179, 255)!,
            Color.fromARGB(255, 164, 179, 255)!,
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
              "Add Statistics",
              style: GoogleFonts.acme(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 193)),
            ),
            SizedBox(
              width: 7,
            ),
            Icon(
              FontAwesomeIcons.circlePlus,
              color: Color.fromARGB(255, 60, 60, 255),
            ),
            SizedBox(
              width: 7,
            ),
          ],
        ),
      ),
      onTap: () => Get.to(() => FormPage()),
    );
  }
}
