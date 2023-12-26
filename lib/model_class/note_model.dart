import 'package:flutter/material.dart';
import 'package:note_app_db_stm/app_db/app_sq_database.dart';

class NoteModel {
  int? note_id;
  String note_title;
  String note_description;


  NoteModel({
    this.note_id,
    required this.note_title,
    required this.note_description,
  });

// model class varibles to map creation   // model class se utha kr values map me do

Map<String,dynamic>  toMap (){
  return {
DatabaseHelper.Note_Column_Id : note_id,
    DatabaseHelper.Note_Column_Title : note_title,
    DatabaseHelper.Note_Column_Desc : note_description,

  };
}

// from map to model class  //

factory NoteModel.fromMap (Map<String,dynamic> map) {

  return NoteModel(
      note_id: map[DatabaseHelper.Note_Column_Id],
      note_title:  map[DatabaseHelper.Note_Column_Title],
    note_description:  map[DatabaseHelper.Note_Column_Desc],
  );
}


}