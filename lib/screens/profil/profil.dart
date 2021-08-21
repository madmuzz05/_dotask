import 'package:dotask/screens/contains.dart';
import 'package:dotask/screens/dashboard/components/bottom_nav.dart';
import 'package:dotask/screens/login/login.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dotask/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final String url = 'http://10.0.2.2:8000/api/friend';
Future _getFriend() async {
  String token = await Network().getToken();
  var res = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });
  // var res = Network().getData('/task');
  var body = json.decode(res.body);
  if (body['success']) {
    print(body);
    return body;
  } else {
    throw Exception('Gagal');
  }
}

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String username = '';
  String address = '';
  String phone = '';
  String email = '';
  void initState() {
    _loadUserData();
    _getFriend();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        username = user['username'];
        address = user['alamat'];
        phone = user['phone'];
        email = user['email'];
      });
    }
  }

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
                              // FutureBuilder(
                              //     future: _getFriend(),
                              //     builder: (BuildContext context,
                              //         AsyncSnapshot snapshot) {
                              //       if (snapshot.data != null) {
                              //         return ListView.builder(
                              //             scrollDirection: Axis.horizontal,
                              //             itemCount:
                              //                 snapshot.data['data'].length,
                              //             itemBuilder: (context, index) {
                              //               return Text(snapshot.data['data']
                              //                   [index]['username']);
                              //               // Friend(
                              //               //   foto: "assets/images/roni.png",
                              //               //   username: snapshot.data['data']
                              //               //       [index]['username'],
                              //               // );
                              //             });
                              //       } else {
                              //         return Row(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [CircularProgressIndicator()],
                              //         );
                              //       }
                              //     }),
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
                                username,
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
                                email,
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
                                phone,
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
                                address,
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
                              logout();
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
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => Login()),
      );
    }
  }
}

class Friend extends StatelessWidget {
  const Friend({Key? key, required this.username, required this.foto})
      : super(key: key);
  final String username, foto;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(foto),
          Text(
            username,
            style: TextStyle(
                color: kBgColor,
                fontFamily: "Popppins",
                fontSize: 12,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class HeaderProfil extends StatefulWidget {
  const HeaderProfil({
    Key? key,
  }) : super(key: key);

  @override
  _HeaderProfilState createState() => _HeaderProfilState();
}

class _HeaderProfilState extends State<HeaderProfil> {
  String firstname = '';
  String lastname = '';

  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        firstname = user['nama_depan'];
        lastname = user['nama_belakang'];
      });
    }
  }

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
              firstname + " " + lastname,
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
