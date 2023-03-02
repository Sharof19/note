import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/domain/hive/hive_data.dart';
import 'package:notes_app/ui/app.dart';


Future<void> main() async{
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

 await Hive.initFlutter();
 Hive.registerAdapter(NotesDataAdapter());
await Hive.openBox<NotesData>('notes');

  runApp(
    const NotesApp(),
  );
}
