import 'dart:ui';
import 'package:dotask/screens/contains.dart';
import 'package:dotask/screens/dashboard/components/bottom_nav.dart';
import 'package:dotask/screens/dashboard/components/dashboard_card.dart';
import 'package:dotask/screens/dashboard/components/header_dashboard.dart';
import 'package:dotask/screens/dashboard/components/task.dart';
import 'package:dotask/screens/dashboard/components/task_list_dash.dart';
import 'package:dotask/screens/dashboard/components/text_sub_bab.dart';
import 'package:dotask/screens/dashboard/components/title_sub_bab.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        child: Column(
          children: <Widget>[
            HeaderDashboard(size: size),
            TitleSubBab(
              text: "My Task",
              fSize: 24,
            ),
            DashBoarCard(),
            TextSubBab(
              text1: "Today Task",
              fSize1: 24,
              text2: "View All",
              fSize2: 14,
            ),
            Expanded(
                child: Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    TaskList(
                        title: "Menyapu rumah",
                        time: "06:30 - 06:31",
                        category: "Home",
                        color1: 0xFFDA1E37),
                    TaskList(
                        title: "Membuat donat",
                        time: "06:31 - 07:30",
                        category: "Home",
                        color1: 0xFF0EAD69),
                    TaskList(
                        title: "Berjualan donat",
                        time: "07:30 - 15:30",
                        category: "Work",
                        color1: 0xFF0EAD69),
                    TaskList(
                        title: "Berjualan mie ayam",
                        time: "14:00 - 22:30",
                        category: "Work",
                        color1: 0xFFFF9505),
                  ],
                ),
                BottomNavigation(
                  home: "assets/icons/home1.png",
                  list: "assets/icons/list.png",
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
