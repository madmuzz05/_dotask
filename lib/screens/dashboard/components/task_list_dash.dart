// import 'dart:convert';

// import 'package:dotask/network/api.dart';
// import 'package:dotask/screens/contains.dart';
// import 'package:dotask/screens/list/list.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// final String url = 'http://10.0.2.2:8000/api/task/';
// Future _getTask() async {
//   String token = await Network().getToken();
//   var res = await http.get(Uri.parse(url), headers: {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $token',
//   });
//   // var res = Network().getData('/task');
//   var body = json.decode(res.body);
//   if (body['success']) {
//     // print(body);
//     return body;
//   } else {
//     throw Exception('Gagal');
//   }
// }

// class TaskList extends StatefulWidget {
//   const TaskList({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _TaskListState createState() => _TaskListState();
// }

// class _TaskListState extends State<TaskList> {
//   var _selection;

//   @override
//   void initState() {
//     super.initState();
//     _getTask();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: _getTask(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.data != null) {
//             // return Container(
//             //   child: Center(
//             //     child: Text(
//             //       'Oke',
//             //       style: TextStyle(fontSize: 20),
//             //     ),
//             //   ),
//             // );
//             return ListView.builder(
//                 itemCount: snapshot.data['user'].length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     padding:
//                         EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 0),
//                     child: SizedBox(
//                       width: 364,
//                       height: 120,
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                           color: kCardColor,
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Container(
//                           padding: EdgeInsets.only(
//                               top: 20, bottom: 20, left: 20, right: 5),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               SizedBox(
//                                 width: 3,
//                                 height: 48,
//                                 child: DecoratedBox(
//                                   decoration: BoxDecoration(
//                                       color: Color(int.parse(snapshot
//                                           .data['user'][index]['warna']))),
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.only(left: 10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Text(
//                                       snapshot.data['user'][index]['title'],
//                                       style: TextStyle(
//                                         color: kTextColor,
//                                         fontSize: 18,
//                                         fontFamily: "Poppins",
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     Text(
//                                       snapshot.data['user'][index]
//                                               ['start_task'] +
//                                           " - " +
//                                           snapshot.data['user'][index]
//                                               ['end_task'],
//                                       style: TextStyle(
//                                         color: kSubTextColor,
//                                         fontSize: 14,
//                                         fontFamily: "Poppins",
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     Spacer(),
//                                     SizedBox(
//                                       width: 60,
//                                       height: 25,
//                                       child: DecoratedBox(
//                                         decoration: BoxDecoration(
//                                           border: Border.all(color: kBgColor),
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                         ),
//                                         child: Container(
//                                           child: Row(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: <Widget>[
//                                               Text(
//                                                 snapshot.data['user'][index]
//                                                     ['kategori'],
//                                                 style: TextStyle(
//                                                   color: kTextColor,
//                                                   fontSize: 10,
//                                                   fontFamily: "Poppins",
//                                                   fontWeight: FontWeight.normal,
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Spacer(),
//                               Container(
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       margin: EdgeInsets.only(top: 10),
//                                       child: OutlinedButton(
//                                         onPressed: () {},
//                                         child: Icon(
//                                           Icons.check,
//                                           color: kBgColor,
//                                           size: 20.0,
//                                         ),
//                                         style: OutlinedButton.styleFrom(
//                                           side: BorderSide(color: kBgColor),
//                                           minimumSize: Size(5, 30),
//                                           shape: StadiumBorder(),
//                                           elevation: 0,
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       margin:
//                                           EdgeInsets.only(top: 10, left: 10),
//                                       child: OutlinedButton(
//                                         onPressed: () {},
//                                         child: Icon(
//                                           Icons.clear,
//                                           color: Color(0xFFDA1E37),
//                                           size: 20.0,
//                                         ),
//                                         style: OutlinedButton.styleFrom(
//                                           side: BorderSide(
//                                               color: Color(0xFFDA1E37)),
//                                           minimumSize: Size(5, 30),
//                                           shape: StadiumBorder(),
//                                           elevation: 0,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Spacer(),
//                               PopupMenuButton(
//                                 padding: EdgeInsets.zero,
//                                 offset: Offset(-20, 40),
//                                 itemBuilder: (BuildContext context) {
//                                   return <PopupMenuEntry>[
//                                     PopupMenuItem(
//                                       child: ListTile(
//                                         title: Text(
//                                           'View all',
//                                           style: TextStyle(
//                                               color: kTitleColor,
//                                               fontSize: 14,
//                                               fontFamily: "Poppins",
//                                               fontWeight: FontWeight.normal),
//                                         ),
//                                         onTap: () {
//                                           Navigator.push(
//                                             context,
//                                             new MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     ListTask()),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                     PopupMenuItem(
//                                       child: ListTile(
//                                         title: Text(
//                                           'View all',
//                                           style: TextStyle(
//                                               color: kTitleColor,
//                                               fontSize: 14,
//                                               fontFamily: "Poppins",
//                                               fontWeight: FontWeight.normal),
//                                         ),
//                                         onTap: () {
//                                           Navigator.push(
//                                             context,
//                                             new MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     ListTask()),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ];
//                                 },
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 });
//           } else {
//             return Container(
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//         });
//   }
// }
