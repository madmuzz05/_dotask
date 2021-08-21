import 'package:dotask/screens/contains.dart';
import 'package:dotask/screens/dashboard/dashboard.dart';
import 'package:dotask/screens/event/event.dart';
import 'package:dotask/screens/list/addTask.dart';
import 'package:dotask/screens/list/list.dart';
import 'package:dotask/screens/profil/profil.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {Key? key,
      required this.home,
      required this.list,
      required this.user,
      required this.event})
      : super(key: key);

  final String home, list, user, event;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.all(10),
        child: SizedBox(
          width: 364,
          height: 71,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DashBoard();
                          },
                        ),
                      );
                    },
                    child: Container(
                      child: Image.asset(home),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ListTask();
                          },
                        ),
                      );
                    },
                    child: Container(
                      child: Image.asset(list),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AddTask();
                          },
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 62,
                      height: 62,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: kBgColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/icons/Add.png")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MyEvent();
                          },
                        ),
                      );
                    },
                    child: Container(
                      child: Image.asset(event),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Profil();
                          },
                        ),
                      );
                    },
                    child: Container(
                      child: Image.asset(user),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
