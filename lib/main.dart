// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         body: Center(
//           child: Column(
//             children: [
//               SizedBox(height: 35,),
//               Text(
//                 "SLOGAN",
//                 style:
//                     TextStyle(color: Colors.green, fontSize: 30),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:comptetion/bottom_nav_bar.dart';
import 'package:comptetion/daily_exercise.dart';
import 'package:comptetion/imageslider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black,title: Center(child: Text('SLOGAN',style: TextStyle(color: Colors.green,fontSize:30 ),))),
        backgroundColor: Colors.black,
        body: BottomNavBar(),
      ),
    );
  }
}

