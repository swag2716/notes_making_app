import 'dart:io';
import 'package:notes_making_app/models/notes_table_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

class NotesDatabase{
  static final NotesDatabase instance = NotesDatabase._init();
  static Database? _database;

  NotesDatabase._init();
  Future<Database> get database async{
    if(_database!=null){
      // Directory documentDirectory = await getApplicationDocumentsDirectory();
      // final path = join(documentDirectory.path, 'notes_app.db');
      // deleteDatabase(path);
      return _database!;
      }
      _database = await _initDB("notes_app.db");
      return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    // final dbPath = await getDatabasesPath();
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, filePath);
    print("path is : ");
    print(path);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> deleteDatabase(String path) =>
    databaseFactory.deleteDatabase(path);

  Future _createDB(Database db, int version) async{
    await db.execute('''CREATE TABLE $tableNotes (
      ${NoteFields.id} INTEGER PRIMARY KEY, 
      ${NoteFields.title} TEXT NOT NULL, 
      ${NoteFields.desc} TEXT NOT NULL, 
      ${NoteFields.time} TEXT NOT NULL
    ) ''');
  }

  Future<Note> create(Note note) async{
    final db = await instance.database;
    final id = await db.insert(tableNotes, note.toMap());
    return note.copy(id: id);
  }

  Future<Note> readNote(int id) async{
    final db = await instance.database;
    final maps = await db.query(tableNotes, columns: NoteFields.values, where: '${NoteFields.id} = ?', whereArgs: [id]);

    if(maps.isNotEmpty){
      return Note.fromMap(maps.first);
    } else{
      throw Exception('ID $id not found');
    }
  }
  Future<List<Note>> readAllNotes() async{
    final db = await instance.database;
    final orderBy = '${NoteFields.time} ASC';
    final result = await db.query(tableNotes, orderBy: orderBy);
    return result.map((map) => Note.fromMap(map)).toList();
  }

  Future<int> delete(int id) async{
    final db = await instance.database;
    return await db.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async{
    final db = await instance.database;
    // db.close();
  }
}