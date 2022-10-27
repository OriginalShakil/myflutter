import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class NotesDatabase {
  final int id;
  final String email;

  const NotesDatabase({
    required this.email,
    required this.id,
  });
  NotesDatabase.fromRow(Map<String, Object?> map)
      : id = map[idcol] as int,
        email = map[mailcol] as String;
}

const idcol = 'idcol';
const mailcol = 'mailcol';
