import 'package:dotask/screens/contains.dart';
import 'package:dotask/screens/dashboard/dashboard.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dotask/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:dotask/services/local_notification_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    _scaffoldKey.currentState?.showSnackBar(snackBar);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    LocalNotificationService.initialize(context);

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    ///forground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
      LocalNotificationService.display(message);
    });

    //app berjalan di background & user tap notif diarahkan ke route
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      Navigator.of(context).pushNamed(routeFromMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      key: _scaffoldKey,
      body: Container(
        child: Column(
          children: [
            HeaderLogin(size: size),
            TextTitle(
              text1: "Welcome",
              text2: "back",
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            hintText: "Email or Username"),
                        validator: (emailValue) {
                          email = emailValue;
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock), hintText: "Password"),
                        obscureText: true,
                        validator: (passwordValue) {
                          password = passwordValue;
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: kBgColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              // decoration: BoxDecoration(color: kBgColor),
              margin: EdgeInsets.only(left: 20, right: 20, top: 80),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login();
                  }
                },
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF718355),
                  onPrimary: Colors.white,
                  minimumSize: Size(265, 47),
                  shape: StadiumBorder(),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'email': email, 'password': password};
    var res = await Network().authData(data, '/login');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => DashBoard()),
      );
    } else {
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({Key? key, required this.text1, required this.text2})
      : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20, top: 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            text1,
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: kBgColor),
          ),
          Text(
            text2,
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: kBgColor),
          ),
        ],
      ),
    );
  }
}

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      height: size.height * 0.27,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.160,
            decoration: BoxDecoration(color: kPrimaryColor),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("assets/icons/logofix1.png"),
                    Text(
                      'Dotask',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kBgColor),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
