import 'package:dotask/screens/contains.dart';
import 'package:dotask/screens/dashboard/components/bottom_nav.dart';
import 'package:dotask/screens/dashboard/components/task_list_dash.dart';
import 'package:dotask/screens/dashboard/components/title_sub_bab.dart';
import 'package:dotask/screens/event/event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:table_calendar/table_calendar.dart';

class ListTask extends StatefulWidget {
  @override
  _ListTaskState createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  late List data;
  CalendarFormat _calendarFormat = CalendarFormat.week;

  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
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
                child: Stack(
              children: <Widget>[
                ListView.builder(
                  // ignore: unnecessary_null_comparison
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TaskList(
                        title: data[index]["title"],
                        time: data[index]["start_task"] +
                            " - " +
                            data[index]["end_task"],
                        category: data[index]["kategori"],
                        color1: 0xFFDA1E37);
                  },
                ),
                BottomNavigation(
                  home: "assets/icons/home2.png",
                  list: "assets/icons/list2.png",
                  user: "assets/icons/user1.png",
                  event: "assets/icons/event1.png",
                )
              ],
            ))
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
