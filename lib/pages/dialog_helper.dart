import 'package:flutter/material.dart';
import 'package:notes_making_app/pages/display_all_notes.dart';
import '../db/notes_database.dart';
import '../models/notes_table_model.dart';

class DialogHelper{
  final Note note;

  DialogHelper(this.note);
  
 static void showDeleteDialog(BuildContext context, noteId){
  
    AlertDialog deleteDialog = AlertDialog(
      shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Colors.black,
            content: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Alert_icon.png"),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Are you sure you want to delete your note?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                        onPressed: () async {
                          await NotesDatabase.instance.delete(noteId);
                          Navigator.of(context).popUntil((route) => route.isFirst);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DisplayAllNotes()));
                        },
                        child: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.white),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              )
            ],
    );
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context)=> 
        deleteDialog
      );
  }

  static void showAlertDialog(BuildContext context){
    AlertDialog alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Colors.black,
            content: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/Alert_icon.png"),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Please enter description!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
    );
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context)=> 
        alertDialog
      );
  }
}