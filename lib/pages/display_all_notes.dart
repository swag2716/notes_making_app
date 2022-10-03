import 'package:flutter/material.dart';
import 'package:notes_making_app/db/notes_database.dart';
import 'package:notes_making_app/pages/home_page.dart';
import '../models/notes_table_model.dart';
import 'add_note_page.dart';
import 'note_card_display.dart';
import 'note_description_page.dart';

class DisplayAllNotes extends StatefulWidget {
  const DisplayAllNotes({super.key});

  @override
  State<DisplayAllNotes> createState() => _DisplayAllNotesState();
}

class _DisplayAllNotesState extends State<DisplayAllNotes> {
  List<Note>? notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  Future refreshNotes() async {
    setState(() {
      isLoading = true;
    });

    this.notes = await NotesDatabase.instance.readAllNotes();
    if (notes == null) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    } else if (notes!.isEmpty) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      body: (notes == null)
          ? const HomePage()
          : (notes!.isEmpty)
              ? const HomePage()
              : SafeArea(
                  child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: const [
                          Text("Notes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 43)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: notes!.length,
                        itemBuilder: (context, index) {
                          final note = notes![index];
                  
                          return GestureDetector(
                            onTap: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NoteDescriptionPage(
                                          noteId: note.id!)));
                              refreshNotes();
                            },
                            child: NoteCardDisplay(note: note, index: index),
                          );
                        },
                      ),
                    )
                  ],
                                )),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNotePage()));
        },
        backgroundColor: const Color.fromARGB(255, 37, 37, 37),
          child: const Icon(Icons.add),
      ),
    );
  }
}
