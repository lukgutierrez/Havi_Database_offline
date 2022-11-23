import 'package:flutter/material.dart';
import 'package:hive_database_proyect/List_Name.dart';
import 'package:hive_database_proyect/hive_data.dart';
import 'package:hive_database_proyect/home_page.dart';
import 'package:hive_database_proyect/players.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PeopleAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: HomePage());
  }
}
