import 'package:hive_database_proyect/players.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveData {
  const HiveData();
  Future<int> savePeople(People people) async {
    final Box<People> box = await Hive.openBox<People>('people');
    return box.add(people);
  }

  Future<int> deletePeople(People people) async {
    final Box<People> box = await Hive.openBox<People>('people');
    return box.clear();
  }

  Future<List<People>> get contact async {
    final Box<People> box = await Hive.openBox<People>('people');
    return box.values.toList();
  }
}
