import 'package:flutter/material.dart';
import 'package:notes_making_app/db/notes_database.dart';
import '../models/notes_table_model.dart';
import 'dialog_helper.dart';


class NoteDescriptionPage extends StatefulWidget {
  final int noteId;

  const NoteDescriptionPage({super.key, required this.noteId});
  @override
  State<NoteDescriptionPage> createState() => _NoteDescriptionPageState();
}

class _NoteDescriptionPageState extends State<NoteDescriptionPage> {
  late Note note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() {
      isLoading = true;
    });
    this.note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: SizedBox(
                          width: 54.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 59, 59, 59),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                )),
                            child: const Icon(Icons.arrow_back_ios_new_rounded),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: SizedBox(
                          width: 54.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () async {
                              DialogHelper.showDeleteDialog(context, widget.noteId);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 59, 59, 59),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                )),
                            child: const Icon(Icons.delete),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 25.0),
                    child: Column(
                      children: [
                        Text(
                          note.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 35.0,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(note.desc,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 23.0,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )),
    );
  }
}
