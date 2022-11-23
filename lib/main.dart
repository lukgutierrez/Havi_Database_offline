import 'package:flutter/material.dart';
import 'package:hive_database_proyect/hive_data.dart';
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
  final TextEditingController controller = TextEditingController();
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
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Column(
            children: [
              TextField(
                controller: controller,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await hiveData.savePeople(
                        People(name: controller.text, old: controller.text));
                    await getData();
                  },
                  child: Text("Hello")),
              Expanded(
                  child: ListView.builder(
                      itemCount: people.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(people[index].name),
                          subtitle: Text(people[index].old),
                        );
                      }))
            ],
          )),
    );
  }
}
