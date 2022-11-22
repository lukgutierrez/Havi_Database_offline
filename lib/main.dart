import 'package:flutter/material.dart';
import 'package:hive_database_proyect/players.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_generator/hive_generator.dart';

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
    final TextEditingController controller = TextEditingController();
    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

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
              ElevatedButton(onPressed: () {}, child: Text("Hello"))
            ],
          )),
    );
  }
}
