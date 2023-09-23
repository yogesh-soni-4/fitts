import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitts/models/health_trackers.dart';
import 'package:fitts/pages/edit_page.dart';
import 'package:fitts/pages/form.dart';
import 'package:fitts/widgets/form_button.dart';
import 'package:fitts/widgets/stats.dart';
import 'package:fitts/widgets/parent_appbar.dart';
import 'package:fitts/widgets/dates.dart';
import 'package:fitts/widgets/graph.dart';
import 'package:fitts/widgets/info.dart' hide Stats;
import 'package:fitts/widgets/steps.dart';
import 'package:fitts/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({Key? key}) : super(key: key);

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  // Future<void> fetchItems() async {
  //   await FirebaseFirestore.instance
  //       .collection("Report")
  //       .doc(selected_date.toString().substring(0, 11))
  //       .snapshots()
  //       .listen((event) {
  //     setState(() {
  //       data["Weight"] = event.get("Weight");
  //       data["BP"] = event.get("BP");
  //       data["Ex"] = event.get("Excercise_duration");
  //       // print(documentData);
  //     });
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchItems();
  // }
  String d = selected_date.toString().substring(0, 11);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade50,
        appBar: ParentMainAppBar(appBar: AppBar()),
        body: Column(
          children: [
            Dates(),
            Steps(),
            Graph(),
            // Divider(height: 20),
            Info(),
            Stats(),
            // BottomNavigation(),
            // SizedBox(height: 45),
            SizedBox(height: 15),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 109,
                ),
                FormButton(),
                SizedBox(
                  width: 45,
                ),
                EditPage()
              ],
            ),
            // SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
