import 'package:flutter/material.dart';

enum ProgramType {
  cardio,
  lift,
}

class ChoiceBox {
  final AssetImage image;
  final String name;
  // final String cals;
  // final String time;
  final ProgramType type;

  ChoiceBox({
    required this.image,
    required this.name,
    // required this.cals,
    // required this.time,
    required this.type,
  });
}

final List<ChoiceBox> ChoiceBoxs = [
  ChoiceBox(
    image: const AssetImage('assets/parent.png'),
    name: 'Parent',
    // cals: ' ',
    // time: ' ',
    type: ProgramType.cardio,
  ),
  ChoiceBox(
    image: const AssetImage('assets/child.png'),
    name: 'Child',
    // cals: '220kkal',
    // time: '20min',
    type: ProgramType.lift,
  ),
];
