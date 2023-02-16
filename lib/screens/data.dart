import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

List<dynamic> myJsonList = [];

Future<void> saveList() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonList = jsonEncode(myJsonList);
  await prefs.setString('myList', jsonList);
}

Future<void> loadList() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString('myList');
  if (jsonString == null) {
    myJsonList = [];
  } else {
    myJsonList = jsonDecode(jsonString);
  }
  if (myJsonList.isEmpty) {
    await prefs.remove('myList');
  }
}

