import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_making_app/add_note.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(25.0),
          child: Text("Notes",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 43)),
        ),
            backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        // children: [
        //   Text("Notes",
        //       style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.w600,
        //           fontSize: 43)),
        child: Expanded(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset("assets/images/Notes_img.png"),
            const Text(
              "Create your first note!",
              style: TextStyle(color: Colors.white),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNote()));
        },
        backgroundColor: Colors.black,
        // foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
