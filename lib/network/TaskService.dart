// import 'package:dotask/model/Task_.dart';
// import 'api.dart';
// import 'dart:convert';

// class TaskService {
//   static String baseUrl = "/task";

//   static Future<List<Task>> getTask() async {
//     final response = await Network().getData(baseUrl);
//     List<Task> list = parseResponse(response.body);
//     return list;
//   }

//   static List<Task> parseResponse(String responseBody) {
//     final List parsedList = json.decode(responseBody);
//     List<Task> list = parsedList.map((val) => Task.fromJson(val)).toList();
//     return list;
//   }
// }
