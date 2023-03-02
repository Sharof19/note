import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/domain/hive/hive_data.dart';

abstract class HiveBoxes{
  
  static final Box<NotesData> notes = Hive.box<NotesData>('notes');
  
}