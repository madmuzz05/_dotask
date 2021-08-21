import 'dart:convert';
import 'package:dotask/model/Task_.dart';
import 'package:dotask/screens/dashboard/components/task.dart';
import 'package:http/http.dart' as http;
import 'package:dotask/network/api.dart';
import 'package:dotask/screens/contains.dart';
import 'package:dotask/screens/list/list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditTask extends StatefulWidget {
  EditTask({Key? key, required this.Task}) : super(key: key);

  final Map Task;
  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final dateFormat = DateFormat("yyyy-MM-dd");
  final timeFormat = DateFormat("HH:mm:ss");
  TextEditingController _title = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _start = TextEditingController();
  TextEditingController _end = TextEditingController();
  TextEditingController _kategori = TextEditingController();
  late String id;

  @override
  void initState() {
    id = widget.Task['id_task'].toString();
    super.initState();
  }

  edit_Task() async {
    final String url = 'http://10.0.2.2:8000/api/task/' + id + '?_method=PUT';
    String token = await Network().getToken();
    var data = {
      'title': _title.text,
      'date_task': _date.text,
      'start_task': _start.text,
      'end_task': _end.text,
      'kategori': _kategori.text
    };
    final res = await http.post(Uri.parse(url), body: data, headers: {
      'Authorization': 'Bearer $token',
    });
    print(jsonDecode(res.body));
    return jsonDecode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Container(
        child: Column(
          children: [
            Container(
              height: 110,
              // decoration: BoxDecoration(color: Colors.amber),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => ListTask()),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 7.5, left: 70),
                    child: Text(
                      "Edit Task",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Poppins",
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 110,
                // decoration: BoxDecoration(color: Colors.blue),
                child: Image.asset(
                  "assets/images/Logo.png",
                  width: 219,
                  height: 72,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 487,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 46, right: 57, left: 57),
                        child: TextFormField(
                          controller: _title..text = widget.Task['title'],
                          decoration: InputDecoration(labelText: "Title task"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your title';
                            }
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, right: 57, left: 57),
                        child: DateTimeField(
                          controller: _date..text = widget.Task['date_task'],
                          decoration: InputDecoration(labelText: "Date task"),
                          format: dateFormat,
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, right: 57, left: 57),
                        child: Row(
                          children: [
                            Container(
                              width: 141,
                              padding: EdgeInsets.only(top: 2),
                              child: DateTimeField(
                                controller: _start
                                  ..text = widget.Task['start_task'],
                                decoration:
                                    InputDecoration(labelText: "Start task"),
                                format: timeFormat,
                                onShowPicker: (context, currentValue) async {
                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        currentValue ?? DateTime.now()),
                                  );
                                  return DateTimeField.convert(time);
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please enter your start task';
                                  }
                                },
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 141,
                              padding: EdgeInsets.only(top: 2),
                              child: DateTimeField(
                                controller: _end
                                  ..text = widget.Task['end_task'],
                                decoration:
                                    InputDecoration(labelText: "End task"),
                                format: timeFormat,
                                onShowPicker: (context, currentValue) async {
                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        currentValue ?? DateTime.now()),
                                  );
                                  return DateTimeField.convert(time);
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please enter your end task';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, right: 57, left: 57),
                        child: TextFormField(
                          controller: _kategori..text = widget.Task['kategori'],
                          decoration: InputDecoration(labelText: "Category"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your kategori';
                            }
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
                              edit_Task().then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListTask()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("Task berhasil diupdate")));
                              });
                            }
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.normal),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF718355),
                            onPrimary: Colors.white,
                            minimumSize: Size(87.5, 27),
                            shape: StadiumBorder(),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
