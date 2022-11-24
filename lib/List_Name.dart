import 'package:flutter/material.dart';
import 'package:hive_database_proyect/hive_data.dart';
import 'package:hive_database_proyect/players.dart';

class ListName extends StatefulWidget {
  final String controller;
  ListName(this.controller);

  @override
  State<ListName> createState() => _ListNameState();
}

class _ListNameState extends State<ListName> {
  final HiveData hiveData = const HiveData();
  List<People> people = [];

  @override
  void initState() {
    getData();
    super.initState();
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
          actions: [
            IconButton(
                onPressed: () async {
                  await hiveData.savePeople(
                      People(name: widget.controller, old: widget.controller));
                  await getData();
                },
                icon: Icon(Icons.save)),
            IconButton(
                onPressed: () async {
                  await hiveData.deletePeople(
                      People(name: widget.controller, old: widget.controller));
                  await getData();
                },
                icon: Icon(Icons.delete))
          ],
        ),
        body: ListView.builder(
            itemCount: people.length,
            itemBuilder: (context, index) => Dismissible(
                  background: Container(
                    color: Colors.red,
                    child: Center(child: Text("DELETE")),
                  ),
                  key: UniqueKey(),
                  onDismissed: (direction) async {
                    await hiveData.deletePeopleIndex(index);

                    await getData();
                  },
                  child: ListTile(
                    title: Text(people[index].name),
                    subtitle: Text(people[index].name),
                  ),
                )));
  }
}
