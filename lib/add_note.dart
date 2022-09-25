import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 50.0,
              width: 52.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 37, 37, 37),
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                )),
                child: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
          ),         
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: TextField(
              cursorColor: Color.fromARGB(255, 154, 154, 154),
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: TextStyle(color: Color.fromARGB(255, 154, 154, 154), fontSize: 48.0, fontWeight: FontWeight.w400),
                border: InputBorder.none
              ),
              style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.w400),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: TextField(
              cursorColor: Color.fromARGB(255, 154, 154, 154),
              decoration: InputDecoration(
                hintText: "Type Something...",
                hintStyle: TextStyle(color: Color.fromARGB(255, 154, 154, 154), fontSize: 23.0, fontWeight: FontWeight.w400),
                border: InputBorder.none
              ),
              style: TextStyle(color: Colors.white, fontSize: 23.0, fontWeight: FontWeight.w400),
            ),
          )
                ],
              )),
    );
  }
}
