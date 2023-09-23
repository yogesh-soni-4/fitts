import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitts/widgets/stats.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

late Map<String, dynamic> dataa = {
  'Weight': '-',
  "BP": '-',
  "Ex": '-',
};

DateTime selected_date = DateTime.now();
late DateTime selected_index;

// List<Item> items = [];
class Item {
  final int b;
  final int x;
  final int w;

  Item({required this.b, required this.x, required this.w});
}

Item items = Item(b: 0, x: 0, w: 0);

