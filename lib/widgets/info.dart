import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
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
                height: 50,
                child: Image.asset(
                  "images/aasf.gif",
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
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
    return Container(
      height: 70,
      width: 75,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8,
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
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
        mainAxisSize: MainAxisSize.min,
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
