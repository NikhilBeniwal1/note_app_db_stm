
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app_db_stm/app_db/app_sq_database.dart';
import '../model_class/note_model.dart';

class NotesProvider extends ChangeNotifier {
 var db = DatabaseHelper.Instance ;

  List<NoteModel> _notes = [];

  List<NoteModel> get notes {
    return _notes;
  }

  void addNote ({ required String title, required  String desc}) async {

   await db.addNote(NoteModel(note_title:  title, note_description:  desc));
notifyListeners();

  }



  void getallNotes () async {
    _notes = await db.getNotes();
}







}