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
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      body: SafeArea(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: const [
              Text("Notes",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 43)),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Image.asset("assets/images/Notes_img.png"),
            const Text(
              "Create your first note!",
              style: TextStyle(color: Colors.white),
            ),
          ]),
        ),
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNotePage()));
        },
        backgroundColor: const Color.fromARGB(1, 37, 37, 37),
        child: const Icon(Icons.add),
      ),
    );
  }
}
