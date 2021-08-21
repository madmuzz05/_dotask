import 'dart:convert';
import 'dart:ui';
import 'package:dotask/network/api.dart';
import 'package:dotask/screens/contains.dart';
import 'package:dotask/screens/dashboard/dashboard.dart';
import 'package:dotask/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;
  var firstname;
  var lastname;
  var phone;
  var address;
  var username;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Header(size: size),
              Title(),
              Container(
                padding:
                    EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 1),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 2),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Username"),
                          validator: (usernameValue) {
                            username = usernameValue;
                            return null;
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 175,
                            padding: EdgeInsets.only(top: 2),
                            child: TextFormField(
                              decoration:
                                  InputDecoration(hintText: "Firstname"),
                              // obscureText: true,
                              validator: (firstnameValue) {
                                firstname = firstnameValue;
                                return null;
                              },
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 175,
                            padding: EdgeInsets.only(top: 2),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: "Lastname"),
                              // obscureText: true,
                              validator: (lastnameValue) {
                                lastname = lastnameValue;
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Phone"),
                          validator: (phoneValue) {
                            phone = phoneValue;
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Email"),
                          validator: (emailValue) {
                            email = emailValue;
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Address"),
                          validator: (addressValue) {
                            if (addressValue!.isEmpty) {
                              return 'Please enter your first name';
                            }
                            address = addressValue;
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Password"),
                          obscureText: true,
                          validator: (passwordValue) {
                            password = password;
                            return null;
                          },
                        ),
                      ),
                      Container(
                        // decoration: BoxDecoration(color: kBgColor),
                        margin: EdgeInsets.only(left: 20, right: 20, top: 35),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _register();
                            }
                          },
                          child: Text(
                            _isLoading ? 'Proccessing...' : 'Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF718355),
                            onPrimary: Colors.white,
                            minimumSize: Size(271, 47),
                            shape: StadiumBorder(),
                            elevation: 0,
                          ),
                        ),
                      ),
                      Container(
                          height: 70,
                          // decoration: BoxDecoration(color: Colors.black),
                          margin: EdgeInsets.only(left: 90, right: 80, top: 5),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              Text(
                                "Have  an  account?",
                                style: TextStyle(
                                    color: kBgColor,
                                    fontSize: 14,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );
                                },
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: kTitleColor,
                                      fontSize: 14,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'username': username,
      'nama_depan': firstname,
      'nama_belakang': lastname,
      'phone': phone,
      'email': email,
      'alamat': address,
      'password': password
    };

    var res = await Network().authData(data, '/register');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => DashBoard()),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.topLeft,
      // decoration: BoxDecoration(color: Colors.amber),
      padding: EdgeInsets.only(left: 20, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Create an",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: kBgColor),
          ),
          Text(
            "account",
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

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      height: size.height * 0.17,
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
