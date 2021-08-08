import 'package:dotask/screens/contains.dart';
import 'package:flutter/material.dart';

class TextSubBab extends StatelessWidget {
  const TextSubBab(
      {Key? key,
      required this.text1,
      required this.fSize1,
      required this.text2,
      required this.fSize2})
      : super(key: key);

  final String text1;
  final double fSize1;
  final String text2;
  final double fSize2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 0),
      child: Row(
        children: [
          Container(
            height: 35,
            child: Stack(
              children: <Widget>[
                Text(
                  text1,
                  style: TextStyle(
                      fontSize: fSize1,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: kTitleColor),
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(top: 9),
            height: 35,
            child: Stack(
              children: <Widget>[
                Text(
                  text2,
                  style: TextStyle(
                      fontSize: fSize2,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.normal,
                      color: kTitleColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
