import 'dart:convert';

import 'package:dotask/screens/contains.dart';
import 'package:flutter/material.dart';
import 'package:dotask/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderDashboard extends StatefulWidget {
  const HeaderDashboard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _HeaderDashboardState createState() => _HeaderDashboardState();
}

class _HeaderDashboardState extends State<HeaderDashboard> {
  late String username;
  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        username = user['username'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding,
        right: 20,
      ),
      height: widget.size.height * 0.155,
      child: Stack(
        children: <Widget>[
          Container(
            height: widget.size.height * 0.13,
            decoration: BoxDecoration(color: kPrimaryColor),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: kSubTextColor),
                      ),
                      Text(
                        'Hi, ' + username,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: kBgColor),
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/images/roni.png",
                    width: 42,
                    height: 42,
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
