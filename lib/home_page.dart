import 'package:flutter/material.dart';
import 'package:hive_database_proyect/List_Name.dart';
import 'package:hive_database_proyect/hive_data.dart';
import 'package:hive_database_proyect/players.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController(text: "");
  final HiveData hiveData = const HiveData();
  List<People> people = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> getData() async {
    people = await hiveData.contact;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('DATABASE HIVE'),
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListName(controller.text),
                      ));
                },
                child: Text("ListName")),
          ],
        ));
  }
}
