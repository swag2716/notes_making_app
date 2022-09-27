import 'package:flutter/material.dart';
import 'package:notes_making_app/database/notes_database.dart';
import 'package:notes_making_app/pages/home_page.dart';
import '../models/notes_table_model.dart';
import 'note_card_display.dart';
import 'note_description_page.dart';

class DisplayAllNotes extends StatefulWidget {
  const DisplayAllNotes({super.key});

  @override
  State<DisplayAllNotes> createState() => _DisplayAllNotesState();
}

class _DisplayAllNotesState extends State<DisplayAllNotes> {
  late List<Note> notes;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();
    super.dispose();
  }

  Future refreshNotes() async {
    setState(() {
      isLoading = true;
    });
    notes = await NotesDatabase.instance.readAllNotes();
    if (notes.isEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => const HomePage())));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (notes.isEmpty) ? null :
      SafeArea(
          child: Column(
        children: [
          const Text("Notes",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 43)),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];

                return GestureDetector(
                  onTap: () async{
                    await Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteDescriptionPage(noteId: note.id!)));
                  },

                  child: NoteCardDisplay(note: note, index: index),
                );
                
              },
            ),
          )
        ],
      ))
    );
  }
}
