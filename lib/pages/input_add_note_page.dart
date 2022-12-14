import 'package:flutter/material.dart';

class InputAddNotePage extends StatefulWidget {
  final String? title;
  final String? desc;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDesc;

  const InputAddNotePage({super.key, this.title = "", this.desc = "", required this.onChangedTitle, required this.onChangedDesc});

  @override
  State<InputAddNotePage> createState() => _InputAddNotePageState();
}

class _InputAddNotePageState extends State<InputAddNotePage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
        TextFormField(
          cursorColor: const Color.fromARGB(255, 154, 154, 154),
          maxLines: null,
          initialValue: widget.title,
          decoration: const InputDecoration(
            hintText: "Title",
            hintStyle: TextStyle(color: Color.fromARGB(255, 154, 154, 154), fontSize: 48.0, fontWeight: FontWeight.w400),
            border: InputBorder.none
          ),
          style: const TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.w400),
          onChanged: widget.onChangedTitle,
        ),
        TextFormField(
          cursorColor: const Color.fromARGB(255, 154, 154, 154),
          maxLines: null,
          initialValue: widget.desc,
          decoration: const InputDecoration(
            hintText: "Type Something...",
            hintStyle: TextStyle(color: Color.fromARGB(255, 154, 154, 154), fontSize: 23.0, fontWeight: FontWeight.w400),
            border: InputBorder.none
          ),
          style: const TextStyle(color: Colors.white, fontSize: 23.0, fontWeight: FontWeight.w400),
          onChanged: widget.onChangedDesc,
        )
              ],
            ),
      ),
    );
  }
}
