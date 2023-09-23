import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitts/models/health_trackers.dart';
import 'package:fitts/pages/edit_page.dart';
import 'package:fitts/pages/form.dart';
import 'package:fitts/widgets/child_appbar.dart';
import 'package:fitts/widgets/form_button.dart';
import 'package:fitts/widgets/stats.dart';
import 'package:fitts/widgets/parent_appbar.dart';
import 'package:fitts/widgets/dates.dart';
import 'package:fitts/widgets/graph.dart';
import 'package:fitts/widgets/info.dart' hide Stats;
import 'package:fitts/widgets/steps.dart';
import 'package:fitts/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class ChildPage extends StatefulWidget {
  const ChildPage({Key? key}) : super(key: key);

  @override
  State<ChildPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ChildPage> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: ChildMainAppBar(appBar: AppBar()),
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
          ],
        ),
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../models/health_trackers.dart';

// class ItemListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Firestore Data as List'),
//         ),
//         body: ItemList(),
//       ),
//     );
//   }
// }

// class ItemList extends StatelessWidget {
//   String d = selected_date.toString().substring(0, 10);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Text(items.b.toString()),
//         Text('items.x.toString()'),
//         Text('items.x.toString()'),
//         Text('items.w.toString()'),
//         StreamBuilder<DocumentSnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection('Report')
//               .doc(selected_date.toString().substring(0, 11))
//               .snapshots(),
//           builder: (context, snapshot) {
//             // if (!snapshot.hasData) {
//             //   return CircularProgressIndicator();
//             // }

//             if (!snapshot.data!.exists) {
//               return Text('Document with ID $d does not exist.');
//             }

//             // Parse the data from the document snapshot
//             var data = snapshot.data!.data() as Map<String, dynamic>;

//             items = Item(
//               w: data['Weight'],
//               b: data['BP'],
//               x: data['Excercise_duration'],
//             );

//             // final documents = snapshot.data!.docs;
//             // for (var document in documents) {
//             //   final data = document.data() as Map<String, dynamic>;

//             //   // Create an Item object and add it to the list
//             //   items.add(Item(
//             //     w: data['Weight'],
//             //     b: data['BP'],
//             //     x: data['Excercise_duration'],
//             //   ));
//             // }

//             return Container(
//               child: Column(
//                 children: [
//                   Text(items.b.toString()),
//                   Text(items.x.toString()),
//                   Text(items.w.toString()),
//                   // Text(items),
//                   // Text(items),
//                 ],
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

// // class Item {
// //   final int b;
// //   final int x;
// //   final int w;

// //   Item({required this.b, required this.x, required this.w});
// // }
