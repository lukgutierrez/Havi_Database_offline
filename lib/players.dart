import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_generator/hive_generator.dart';

part 'players.g.dart';

@HiveType(typeId: 1)
class People {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String old;

  People({
    required this.name,
    required this.old,
  });
}
