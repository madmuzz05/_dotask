import 'package:dotask/model/Task_.dart';
import 'package:dotask/network/TaskService.dart';
import 'package:dotask/network/api.dart';
import 'package:dotask/screens/contains.dart';
import 'package:dotask/screens/dashboard/components/bottom_nav.dart';
import 'package:dotask/screens/dashboard/components/task_list_dash.dart';
import 'package:dotask/screens/dashboard/components/title_sub_bab.dart';
import 'package:dotask/screens/event/event.dart';
import 'package:dotask/screens/list/editTask.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:table_calendar/table_calendar.dart';

final String url = 'http://10.0.2.2:8000/api/task/';
Future _getTask() async {
  String token = await Network().getToken();
  var res = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });
  // var res = Network().getData('/task');
  var body = json.decode(res.body);
  if (body['success']) {
    // print(body);
    return body;
  } else {
    throw Exception('Gagal');
  }
}

class ListTask extends StatefulWidget {
  @override
  _ListTaskState createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  // late Future<Task> task;
  CalendarFormat _calendarFormat = CalendarFormat.week;

  DateTime _focusedDay = DateTime.now();


  Future delete_Task(String id) async {
    final String url = 'http://10.0.2.2:8000/api/task/' + id;
    String token = await Network().getToken();
    final res = await http.delete(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
    });
    print(jsonDecode(res.body));
    return jsonDecode(res.body);
  }

  @override
  void initState() {
    super.initState();
    _getTask();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        child: Column(
          children: <Widget>[
            SearchHeader(size: size),
            TitleSubBab(
              text: "Date Task",
              fSize: 24,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                calendarFormat: _calendarFormat,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: TitleSubBab(
                text: "Task",
                fSize: 24,
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: _getTask(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data != null) {
                      return ListView.builder(
                          itemCount: snapshot.data['user'].length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 5, top: 0),
                              child: SizedBox(
                                width: 364,
                                height: 120,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: kCardColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        left: 20,
                                        right: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 3,
                                          height: 48,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Color(int.parse(
                                                    snapshot.data['user'][index]
                                                        ['warna']))),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                snapshot.data['user'][index]
                                                    ['title'],
                                                style: TextStyle(
                                                  color: kTextColor,
                                                  fontSize: 18,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                snapshot.data['user'][index]
                                                        ['start_task'] +
                                                    " - " +
                                                    snapshot.data['user'][index]
                                                        ['end_task'],
                                                style: TextStyle(
                                                  color: kSubTextColor,
                                                  fontSize: 14,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Spacer(),
                                              SizedBox(
                                                width: 60,
                                                height: 25,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: kBgColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Container(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(
                                                          snapshot.data['user']
                                                                  [index]
                                                              ['kategori'],
                                                          style: TextStyle(
                                                            color: kTextColor,
                                                            fontSize: 10,
                                                            fontFamily:
                                                                "Poppins",
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: OutlinedButton(
                                                  onPressed: () {},
                                                  child: Icon(
                                                    Icons.check,
                                                    color: kBgColor,
                                                    size: 20.0,
                                                  ),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: BorderSide(
                                                        color: kBgColor),
                                                    minimumSize: Size(5, 30),
                                                    shape: StadiumBorder(),
                                                    elevation: 0,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 10, left: 10),
                                                child: OutlinedButton(
                                                  onPressed: () {},
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: Color(0xFFDA1E37),
                                                    size: 20.0,
                                                  ),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFFDA1E37)),
                                                    minimumSize: Size(5, 30),
                                                    shape: StadiumBorder(),
                                                    elevation: 0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        PopupMenuButton(
                                          padding: EdgeInsets.zero,
                                          offset: Offset(-20, 40),
                                          itemBuilder: (BuildContext context) {
                                            return <PopupMenuEntry>[
                                              PopupMenuItem(
                                                child: ListTile(
                                                  title: Text(
                                                    'Edit',
                                                    style: TextStyle(
                                                        color: kTitleColor,
                                                        fontSize: 14,
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      new MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditTask(
                                                                  Task: snapshot
                                                                              .data[
                                                                          'user']
                                                                      [index])),
                                                    );
                                                  },
                                                ),
                                              ),
                                              PopupMenuItem(
                                                child: ListTile(
                                                  title: Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color: kTitleColor,
                                                        fontSize: 14,
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                  onTap: () {
                                                    delete_Task(snapshot
                                                            .data['user'][index]
                                                                ['id_task']
                                                            .toString())
                                                        .then((value) {
                                                      setState(() {});
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(
                                                                  "Task berhasil dihapus")));
                                                    });
                                                  },
                                                ),
                                              ),
                                            ];
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  }),
            ),
            BottomNavigation(
              home: "assets/icons/home2.png",
              list: "assets/icons/list2.png",
              user: "assets/icons/user1.png",
              event: "assets/icons/event1.png",
            )
          ],
        ),
      ),
    );
  }
}

class FilterTask extends StatelessWidget {
  const FilterTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 30,
        width: 95,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: kBgColor),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not Completed",
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.normal,
                      color: kBgColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 45),
      height: size.height * 0.150,
      child: Stack(
        children: <Widget>[
          Container(
              height: size.height * 0.10,
              decoration: BoxDecoration(color: kPrimaryColor),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    height: 45,
                    width: 363,
                    decoration: BoxDecoration(
                        color: kCardColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: kCardColor)),
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search"),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
