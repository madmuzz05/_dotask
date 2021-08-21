import 'package:dotask/screens/contains.dart';
import 'package:dotask/screens/dashboard/components/bottom_nav.dart';
import 'package:dotask/screens/dashboard/components/task_list_dash.dart';
import 'package:dotask/screens/dashboard/components/title_sub_bab.dart';
import 'package:flutter/material.dart';

class MyEvent extends StatefulWidget {
  @override
  _MyEventState createState() => _MyEventState();
}

class _MyEventState extends State<MyEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Container(
                            padding:
                                EdgeInsets.only(left: 20, bottom: 5, top: 10),
                            alignment: Alignment.bottomLeft,
                            height: 70,
                            decoration: BoxDecoration(color: kPrimaryColor),
                            child: Text(
                              "My Event",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600,
                                  color: kTitleColor),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 65),
                    child: ListView(
                      children: [
                        TaskMyEvent(),
                        TaskMyEvent(),
                        TaskMyEvent(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 2, top: 10),
              child: TitleSubBab(
                text: "Event List",
                fSize: 24,
              ),
            ),
            Expanded(
              child:
                  // Container(
                  //   height: 40,
                  //   margin: EdgeInsets.only(left: 20, top: 10, bottom: 0),
                  //   padding: EdgeInsets.only(bottom: 5),
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: [
                  //       FilterBtnBg(
                  //         text: "All",
                  //       ),
                  //       FilterBtn(
                  //         text: "Join",
                  //       ),
                  //       FilterBtn(
                  //         text: "Not join",
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                padding: EdgeInsets.only(top: 50),
                child: ListView(
                  children: <Widget>[
                    TaskEventList(),
                    TaskEventList(),
                    TaskEventList(),
                    TaskEventList(),
                    TaskEventList()
                  ],
                ),
              ),
            ),
            BottomNavigation(
              home: "assets/icons/home2.png",
              list: "assets/icons/list.png",
              user: "assets/icons/user1.png",
              event: "assets/icons/event2.png",
            ),
          ],
        ),
      ),
    );
  }
}

class FilterBtn extends StatelessWidget {
  const FilterBtn({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      // decoration: BoxDecoration(color: kBgColor),
      child: OutlinedButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              color: kBgColor,
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w100),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: kBgColor),
          minimumSize: Size(83, 30),
          shape: StadiumBorder(),
          elevation: 0,
        ),
      ),
    );
  }
}

class FilterBtnBg extends StatelessWidget {
  const FilterBtnBg({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: kBgColor),
      child: OutlinedButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w100),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: kBgColor,
          side: BorderSide(color: kBgColor),
          minimumSize: Size(83, 30),
          shape: StadiumBorder(),
          elevation: 0,
        ),
      ),
    );
  }
}

class TaskEventList extends StatelessWidget {
  const TaskEventList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 0),
      child: SizedBox(
        width: 364,
        height: 120,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 3,
                  height: 70,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: kTitleColor),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Menyapu Rumah",
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "03 Juli 2021 | 18:00 - 19.00",
                        style: TextStyle(
                          color: kSubTextColor,
                          fontSize: 13,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Rumah Roni",
                        style: TextStyle(
                          color: kSubTextColor,
                          fontSize: 13,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "Riza Budi",
                      style: TextStyle(
                          color: kSubTextColor,
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      // decoration: BoxDecoration(color: kBgColor),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Join",
                          style: TextStyle(
                              color: kBgColor,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w100),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: kBgColor),
                          minimumSize: Size(44, 30),
                          shape: StadiumBorder(),
                          elevation: 0,
                        ),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Container(
                    padding: EdgeInsets.only(right: 5),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/icons/details1.png"),
                        ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TaskMyEvent extends StatelessWidget {
  const TaskMyEvent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 0),
      child: SizedBox(
        width: 364,
        height: 120,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 3,
                  height: 70,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: kTitleColor),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Menyapu Rumah",
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "03 Juli 2021 | 18:00 - 19.00",
                        style: TextStyle(
                          color: kSubTextColor,
                          fontSize: 13,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Rumah Roni",
                        style: TextStyle(
                          color: kSubTextColor,
                          fontSize: 13,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                    padding: EdgeInsets.only(right: 5),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/icons/details1.png"),
                        ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
