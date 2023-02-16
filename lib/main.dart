import 'package:flutter/material.dart';
import 'package:flutter_app/screens/list.dart';
import 'package:flutter_app/screens/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  runApp(MyApp());
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('myList');
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    myJsonList.clear();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: ListPage(),
    );
  }
}
