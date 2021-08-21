import 'package:dotask/screens/contains.dart';
import 'package:dotask/screens/list/list.dart';
import 'package:flutter/material.dart';

class TextSubBab extends StatelessWidget {
  const TextSubBab({Key? key, required this.text1, required this.fSize1})
      : super(key: key);

  final String text1;
  final double fSize1;

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
            height: 50,
            child: Stack(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => ListTask()),
                    );
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(
                        color: kTitleColor,
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
