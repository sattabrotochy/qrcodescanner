import 'package:qrcodescanner/Model/my_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';



class DatabaseHelper{

  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;

  String noteTable = 'note_table';
  String noteTable2 = 'note_table2';

  String colId = 'id';
  String colTitle = 'title';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }
  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT)');
    //his
    await db.execute('CREATE TABLE $noteTable2($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT)');
  }


  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }
  //his
  Future<int> insertNote2(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable2, note.toMap());
    return result;
  }


  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

	var result = await db.rawQuery('SELECT * FROM $noteTable order by $colId ASC');
  //  var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }
  /// his

  Future<List<Map<String, dynamic>>> getNoteMapList2() async {
    Database db = await this.database;

	var result = await db.rawQuery('SELECT * FROM $noteTable2 order by $colId ASC');
  //  var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }





  Future<int> deleteNote(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

  Future<int> deleteNote2(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $noteTable2 WHERE $colId = $id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }


  Future<List<Note>> getNoteList() async {

    var noteMapList = await getNoteMapList(); // Get 'Map List' from database
    int count = noteMapList.length;         // Count the number of map entries in db table

    List<Note> noteList = List<Note>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }
  ///his

 Future<List<Note>> getNoteList2() async {

    var noteMapList = await getNoteMapList2(); // Get 'Map List' from database
    int count = noteMapList.length;         // Count the number of map entries in db table

    List<Note> noteList = List<Note>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }

}