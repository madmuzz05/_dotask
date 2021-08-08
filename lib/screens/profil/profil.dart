import 'package:dotask/screens/contains.dart';
import 'package:dotask/screens/dashboard/components/bottom_nav.dart';
import 'package:dotask/screens/login/login.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dotask/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        child: Column(
          children: [
            HeaderProfil(),
            Container(
              padding:
                  EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 20),
              child: Expanded(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Friends",
                                style: TextStyle(
                                  color: kTitleColor,
                                  fontFamily: "Popppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Image.asset("assets/icons/Addf.png")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SizedBox(
                            width: size.width * 1,
                            height: 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: kSubTextColor),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/erik1.png"),
                                    Text(
                                      "Riza Budi",
                                      style: TextStyle(
                                          color: kBgColor,
                                          fontFamily: "Popppins",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset("assets/images/aad1.png"),
                                    Text(
                                      "Miqdad D.",
                                      style: TextStyle(
                                          color: kBgColor,
                                          fontFamily: "Popppins",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/amel1.png"),
                                    Text(
                                      "Erika",
                                      style: TextStyle(
                                          color: kBgColor,
                                          fontFamily: "Popppins",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/more.png"),
                                    Text(
                                      "View More",
                                      style: TextStyle(
                                          color: kBgColor,
                                          fontFamily: "Popppins",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Username",
                                style: TextStyle(color: kTitleColor),
                              ),
                              Spacer(),
                              Text(
                                "Roniboy",
                                style: TextStyle(color: kBgColor),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SizedBox(
                            width: size.width * 1,
                            height: 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: kSubTextColor),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(color: kTitleColor),
                              ),
                              Spacer(),
                              Text(
                                "Roniboy27@gmail.com",
                                style: TextStyle(color: kBgColor),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SizedBox(
                            width: size.width * 1,
                            height: 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: kSubTextColor),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Phone",
                                style: TextStyle(color: kTitleColor),
                              ),
                              Spacer(),
                              Text(
                                "+6288996978347",
                                style: TextStyle(color: kBgColor),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SizedBox(
                            width: size.width * 1,
                            height: 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: kSubTextColor),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Date of birth",
                                style: TextStyle(color: kTitleColor),
                              ),
                              Spacer(),
                              Text(
                                "19 April 1998",
                                style: TextStyle(color: kBgColor),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SizedBox(
                            width: size.width * 1,
                            height: 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: kSubTextColor),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Address",
                                style: TextStyle(color: kTitleColor),
                              ),
                              Spacer(),
                              Text(
                                "Desa Roomo",
                                style: TextStyle(color: kBgColor),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SizedBox(
                            width: size.width * 1,
                            height: 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: kSubTextColor),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 20),
                          // decoration: BoxDecoration(color: kBgColor),
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Login();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "Sign Out",
                              style: TextStyle(
                                  color: Color(0xFFDA1E37),
                                  fontFamily: "Poppins",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Color(0xFFDA1E37)),
                              minimumSize: Size(83, 30),
                              shape: StadiumBorder(),
                              elevation: 0,
                            ),
                          ),
                        ),
                        BottomNavigation(
                          home: "assets/icons/home2.png",
                          list: "assets/icons/list.png",
                          user: "assets/icons/user2.png",
                          event: "assets/icons/event1.png",
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void logout() async {
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}

class HeaderProfil extends StatelessWidget {
  const HeaderProfil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 20),
      height: 290,
      decoration: BoxDecoration(color: kPrimaryColor),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Image.asset("assets/icons/edit.png"),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Image.asset(
              "assets/images/roni.png",
              width: 144,
              height: 144,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Muhammad Habbyl Zumroni",
              style: TextStyle(
                  color: kTitleColor,
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Change Password",
              style: TextStyle(
                  color: kBgColor,
                  fontFamily: "Poppins",
                  fontSize: 13,
                  fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
