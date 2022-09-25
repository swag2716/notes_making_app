import 'package:flutter/material.dart';
import 'package:notes_making_app/pages/add_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Padding(
      //     padding: EdgeInsets.all(25.0),
      //     child: Text("Notes",
      //         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 43)),
      //   ),
      //       backgroundColor: Colors.transparent,
      // ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Notes",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 43)),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
            Image.asset("assets/images/Notes_img.png"),
            const Text(
              "Create your first note!",
              style: TextStyle(color: Colors.white),
            ),
          ]),
        ),
      ]),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNote()));
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
