import 'dart:ui';

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
    final color = cardColors[index% cardColors.length];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: color,
        child: Container(
          constraints: const BoxConstraints(minHeight: 20.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
              Text(
                note.title,
                style: TextStyle(color: Colors.black, ),
              )
            ],),
          )
        ),
      ),
    );
  }
}