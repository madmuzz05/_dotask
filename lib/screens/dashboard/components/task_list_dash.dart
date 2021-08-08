import 'package:dotask/screens/contains.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList(
      {Key? key,
      required this.title,
      required this.time,
      required this.category,
      required this.color1})
      : super(key: key);

  final int color1;
  final String title, time, category;
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
                  height: 48,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(color1)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 18,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        time,
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
                            border: Border.all(color: kBgColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  category,
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 10,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
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
