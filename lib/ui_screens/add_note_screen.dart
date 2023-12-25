import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:note_app_db_stm/provider/provider.dart';


class AddNoteScreen extends StatelessWidget {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _descEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _titleEditingController,
              decoration: InputDecoration(
                labelText: 'Enter note title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            TextField(
              controller: _descEditingController,
              decoration: InputDecoration(
                labelText: 'Enter note desic...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {

               Provider.of<NotesProvider>(context,listen: false).addNote(
                   title: _titleEditingController.text.toString(),
                   desc: _descEditingController.text.toString());

               Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
