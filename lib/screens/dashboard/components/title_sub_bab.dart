import 'package:dotask/screens/contains.dart';
import 'package:flutter/material.dart';

class TitleSubBab extends StatelessWidget {
  const TitleSubBab({
    Key? key,
    required this.text,
    required this.fSize,
  }) : super(key: key);

  final String text;
  final double fSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 35,
            child: Stack(
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                      fontSize: fSize,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: kTitleColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
