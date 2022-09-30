import 'package:flutter/material.dart';

import 'add_note_page.dart';

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
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(25.0),
          child: Text("Notes",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 43)),
        ),
            backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
              Image.asset("assets/images/Notes_img.png"),
              const Text(
                "Create your first note!",
                style: TextStyle(color: Colors.white),
              ),
            ]),
          ),
        ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNotePage()));
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
