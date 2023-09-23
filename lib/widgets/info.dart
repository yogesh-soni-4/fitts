import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatelessWidget {
  Info({Key? key}) : super(key: key);

  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            // horizontal: 30,
            horizontal: width * 0.06,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Workout Stats',
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 8),
              Container(
                // height: 50,
                height: height * 0.072,
                child: Image.asset(
                  "images/aasf.gif",
                ),
              )
            ],
          ),
        ),
        SizedBox(
          // height: 5,
          height: height * 0.006,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stats(value: '90', unit: 'BPM', label: 'Heart Rate'),
              Stats(value: '345', unit: 'kcal', label: 'Calories'),
              Stats(value: '3.6', unit: 'km', label: 'Distance'),
              Stats(value: '1.5', unit: 'hr', label: 'Hours'),
            ],
          ),
        ),
      ],
    );
  }
}

class Stats extends StatelessWidget {
  final String value;
  final String unit;
  final String label;

  const Stats({
    Key? key,
    required this.value,
    required this.unit,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      // height: 70,
      height: height * 0.1,
      // width: 75,
      width: width * 0.21,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8,
      ),
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
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
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
                text: value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: unit,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]),
          ),
          const SizedBox(height: 0),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
