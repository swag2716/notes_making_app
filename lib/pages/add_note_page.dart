import 'package:flutter/material.dart';
import 'package:notes_making_app/db/notes_database.dart';
import 'package:notes_making_app/pages/display_all_notes.dart';
import 'package:notes_making_app/pages/input_add_note_page.dart';
import '../models/notes_table_model.dart';
import 'dialog_helper.dart';

class AddNotePage extends StatefulWidget {
  final Note? note;

  const AddNotePage({super.key, this.note});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final formKey = GlobalKey<FormState>();
  late String title;
  late String desc;

  @override
  void initState(){
    super.initState();

    title = widget.note?.title??"";
    desc = widget.note?.desc??"";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      body: SafeArea(child: Column(children: [
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
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 59, 59, 59),
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
                    onPressed: () {
                      if(desc.isEmpty){
                        DialogHelper.showAlertDialog(context);
                      }
                      else{
                        saveNote();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DisplayAllNotes()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 59, 59, 59),
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    )),
                    child: const Icon(Icons.save),
                  ),
                ),
              ),
            ],
          ), 

          Form(          
            key: formKey,
            child: InputAddNotePage(onChangedTitle: (title) => setState(() {
            this.title = title;
          }), onChangedDesc: (desc) => setState(() {
            this.desc  =desc;
          })))       
      ],)),
    );

  }

  Future saveNote() async{
    final note = Note(
      title: title,
      desc: desc,
      createdTime: DateTime.now(),
      );

      await NotesDatabase.instance.create(note);
  }
}