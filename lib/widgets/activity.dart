import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitts/pages/analysis_page.dart/analysis.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RecentActivities extends StatelessWidget {
  const RecentActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Activity', style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffe1e1e1),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,

                          color: Color.fromARGB(255, 136, 158, 255),
                          // color: Color.fromARGB(255, 221, 255, 182)
                        ),
                        height: 40,
                        width: 40,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            //   image: AssetImage('assets/running.jpg'),
                            //   fit: BoxFit.fill,
                            // ),
                          ),
                          child: Icon(FontAwesomeIcons.personSwimming),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Swimming",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      const Icon(Icons.timer, size: 20),
                      const SizedBox(width: 5),
                      const Text(
                        '30min',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.wb_sunny_outlined, size: 20),
                      const SizedBox(width: 5),
                      const Text(
                        '55kcal',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffe1e1e1),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,

                            // color: Color(0xffcff2ff),
                            color: Color.fromARGB(255, 198, 251, 138)),
                        height: 40,
                        width: 40,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            //   image: AssetImage('assets/running.jpg'),
                            //   fit: BoxFit.fill,
                            // ),
                          ),
                          child: Icon(FontAwesomeIcons.personWalking),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Walking",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      const Icon(Icons.timer, size: 20),
                      const SizedBox(width: 5),
                      const Text(
                        '30min',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.wb_sunny_outlined, size: 20),
                      const SizedBox(width: 5),
                      const Text(
                        '55kcal',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffe1e1e1),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,

                            // color: Color(0xffcff2ff),
                            color: Color.fromARGB(255, 111, 255, 188)),
                        height: 40,
                        width: 40,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            //   image: AssetImage('assets/running.jpg'),
                            //   fit: BoxFit.fill,
                            // ),
                          ),
                          child: Icon(FontAwesomeIcons.personRunning),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Running",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      const Icon(Icons.timer, size: 20),
                      const SizedBox(width: 5),
                      const Text(
                        '30min',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.wb_sunny_outlined, size: 20),
                      const SizedBox(width: 5),
                      const Text(
                        '55kcal',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffe1e1e1),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,

                            // color: Color(0xffcff2ff),
                            color: Color.fromARGB(255, 206, 187, 187)),
                        height: 40,
                        width: 40,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            //   image: AssetImage('assets/running.jpg'),
                            //   fit: BoxFit.fill,
                            // ),
                          ),
                          child: Icon(FontAwesomeIcons.personHiking),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Hiking",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      const Icon(Icons.timer, size: 20),
                      const SizedBox(width: 5),
                      const Text(
                        '30min',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.wb_sunny_outlined, size: 20),
                      const SizedBox(width: 5),
                      const Text(
                        '55kcal',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffe1e1e1),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,

                            // color: Color(0xffcff2ff),
                            color: Color.fromARGB(255, 255, 157, 157)),
                        height: 40,
                        width: 40,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            //   image: AssetImage('assets/running.jpg'),
                            //   fit: BoxFit.fill,
                            // ),
                          ),
                          child: Icon(FontAwesomeIcons.personBiking),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Cycling",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      const Icon(Icons.timer, size: 20),
                      const SizedBox(width: 5),
                      const Text(
                        '30min',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.wb_sunny_outlined, size: 20),
                      const SizedBox(width: 5),
                      const Text(
                        '55kcal',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

// class ActivityItem extends StatelessWidget {
//   const ActivityItem({Key? key}) : super(key: key);

//   static const activities = [
//     'Running',
//     'Swimming',
//     'Hiking',
//     'Walking',
//     'Cycling'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // String activity = activities[Random().nextInt(activities.length)];

//     return GestureDetector(
//       onTap: () {
//         // Navigator.of(context).pushNamed('/details');
//         // Get.to(()=>DetailsPage());
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 5),
//         height: 50,
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: const Color(0xffe1e1e1),
//           ),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           children: [
//             const SizedBox(width: 10),
//             Container(
//               padding: const EdgeInsets.all(4),
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xffcff2ff),
//               ),
//               height: 35,
//               width: 35,
//               child: Container(
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   // image: DecorationImage(
//                   //   image: AssetImage('assets/running.jpg'),
//                   //   fit: BoxFit.fill,
//                   // ),
//                 ),
//                 child: Icon(FontAwesomeIcons.personSwimming),
//               ),
//             ),
//             const SizedBox(width: 20),
//             Text(
//               activities,
//               style: const TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//             const Expanded(child: SizedBox()),
//             const Icon(Icons.timer, size: 16),
//             const SizedBox(width: 5),
//             const Text(
//               '30min',
//               style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
//             ),
//             const SizedBox(width: 10),
//             const Icon(Icons.wb_sunny_outlined, size: 16),
//             const SizedBox(width: 5),
//             const Text(
//               '55kcal',
//               style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
//             ),
//             const SizedBox(
//               width: 20,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
