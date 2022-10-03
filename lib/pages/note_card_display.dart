import 'package:flutter/material.dart';
import '../models/notes_table_model.dart';

final cardColors = [
  const Color.fromARGB(255, 253, 153, 255),
  const Color.fromARGB(255, 255, 158, 158),
  const Color.fromARGB(255, 145, 244, 143),
  const Color.fromARGB(255, 255, 245, 153),
  const Color.fromARGB(255, 158, 255, 255),
  const Color.fromARGB(255, 182, 156, 255),
];

class NoteCardDisplay extends StatelessWidget {
  final Note note;
  final int index;

  const NoteCardDisplay({super.key, required this.note, required this.index});
  

  @override
  Widget build(BuildContext context) {
    String result;
    if(note.title.isEmpty){
      result = note.desc;
    }
    else{
      result = note.title + "\n" + note.desc;
    }
    String result30;
    if(result.length>30){
      result30 = result.substring(0, 30);
      result30 = result30 + "...";
    }
    else{
      result30 = result;
    }
    final color = cardColors[index% cardColors.length];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: color,
        child: Container(
          constraints: const BoxConstraints(minHeight: 20.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  result30,
                  style: const TextStyle(color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w400),
                ),
              )
            ],),
          )
        ),
      ),
    );
  }
}