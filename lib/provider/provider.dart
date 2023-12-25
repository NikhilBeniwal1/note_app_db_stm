
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model_class/note_model.dart';

class NotesProvider extends ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes {
    return _notes;
  }

  void addNote ({ required String title, required  String desc}){

    _notes.add(Note(title: title, description: desc));
notifyListeners();

  }







}