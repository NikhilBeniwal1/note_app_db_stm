import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:note_app_db_stm/provider/provider.dart';
import 'package:provider/provider.dart';
import 'add_note_screen.dart';

class NotesList extends StatefulWidget {
  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes.'),
      ),
      body: ListView.builder(
        itemCount: Provider.of<NotesProvider>(context).notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${
             Provider.of<NotesProvider>(context).notes[index].note_title
            }"),
            subtitle: Text("${
            Provider.of<NotesProvider>(context).notes[index].note_description
            }"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddNoteScreen();
          },));
        },
        child: Icon(Icons.add),
      ),
    );
  }


}