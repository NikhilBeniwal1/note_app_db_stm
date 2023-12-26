import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

import '../model_class/note_model.dart';

class DatabaseHelper {

  /// single ton privat constroctor
  /// it can not be use from out side the class
  /// it can not be called multiple times inside class as well
  DatabaseHelper._();
   static final DatabaseHelper Instance = DatabaseHelper._();
  Database? myDB;

/*  /// login pref key
static final String Login_User_id = "uid";*/

/*/// table name for database
static final String User_Table = "users";*/
static final String Note_Table = "notes";

/*
/// user table column names
  static final String User_Column_Id = "uId";
  static final String User_Column_Name = "uName";
  static final String User_Column_Email = "uEmail";
  static final String User_Column_Pass = "uPass";
*/

/// note's table column names
static final String Note_Column_Id = "noteId";
  static final String Note_Column_Title = "title";
  static final String Note_Column_Desc = "desc";


 /// creating or executing database

Future<Database> initDatabase() async {
  String dbpath = join(await getDatabasesPath(),"notesDB.db");

 return await openDatabase(
   dbpath ,
   version: 1,
   onCreate: (db, version) {
     /// create all your tables here // when app runs for first time
  /*   /// users table
     db.execute("create table $User_Table ( $User_Column_Id integer primary key autoincrement, $User_Column_Name text,$User_Column_Email text,$User_Column_Pass text )");
*/
     /// notes table
     db.execute("create table $Note_Table ( $Note_Column_Id integer primary key autoincrement, $Note_Column_Title text, $Note_Column_Desc text )");

   }, );

}

Future<Database> getDatabase() async {
  if ( myDB != null) {
    return myDB!;
  } else {
    myDB = await initDatabase();
    return myDB!;
  }
}

Future<bool>  addNote (NoteModel newNote) async {
  var db = await getDatabase();
 int rowseffected = await db.insert(Note_Table, newNote.toMap());

return rowseffected>0 ;
}

Future<List<NoteModel>> getNotes () async {
  var db = await getDatabase();
  List<Map<String,dynamic>> maps = await db.query(Note_Table);

 return List.generate(maps.length, (i) =>
     NoteModel(
       note_id:  maps[i][Note_Column_Id],
         note_title:  maps[i][Note_Column_Title],
         note_description:  maps[i][Note_Column_Desc],

     ));

}


}