import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  int? id;
  String? title;
  String? desc;
  DateTime? createdTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: SizedBox(
                  width: 54.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    )),
                    child: const Icon(Icons.save),
                  ),
                ),
              ),
            ],
          ),         
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: TextFormField(
              cursorColor: const Color.fromARGB(255, 154, 154, 154),
              maxLines: null,
              decoration: const InputDecoration(
                hintText: "Title",
                hintStyle: TextStyle(color: Color.fromARGB(255, 154, 154, 154), fontSize: 48.0, fontWeight: FontWeight.w400),
                border: InputBorder.none
              ),
              style: const TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: TextFormField(
              cursorColor: const Color.fromARGB(255, 154, 154, 154),
              maxLines: null,
              decoration: const InputDecoration(
                hintText: "Type Something...",
                hintStyle: TextStyle(color: Color.fromARGB(255, 154, 154, 154), fontSize: 23.0, fontWeight: FontWeight.w400),
                border: InputBorder.none
              ),
              style: const TextStyle(color: Colors.white, fontSize: 23.0, fontWeight: FontWeight.w400),
            ),
          )
                ],
              )),
    );
  }
}
