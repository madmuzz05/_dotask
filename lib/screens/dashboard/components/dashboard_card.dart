import 'package:dotask/screens/contains.dart';
import 'package:flutter/material.dart';

class DashBoarCard extends StatefulWidget {
  const DashBoarCard(
      {Key? key,
      required this.all,
      required this.complete,
      required this.canceled,
      required this.pending})
      : super(key: key);

  final String complete, canceled, all, pending;

  @override
  _DashBoarCardState createState() => _DashBoarCardState();
}

class _DashBoarCardState extends State<DashBoarCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  width: 178,
                  height: 158,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFF0EAD69),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(5, 7),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/icons/d1.png"),
                          Spacer(),
                          Text(
                            "Complete",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            widget.complete,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: SizedBox(
                  width: 178,
                  height: 122,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFFFF9505),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(5, 7),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/icons/d2.png"),
                          Spacer(),
                          Text(
                            "Pending",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            widget.pending,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  width: 178,
                  height: 122,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFF25CED1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(5, 7),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/icons/d3.png"),
                          Spacer(),
                          Text(
                            "All Task",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            widget.all,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: SizedBox(
                  width: 178,
                  height: 158,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFFDA1E37),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(5, 7),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/icons/d4.png"),
                          Spacer(),
                          Text(
                            "Canceled",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            widget.canceled,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
