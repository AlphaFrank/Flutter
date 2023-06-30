import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:example/homescreen.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<AddPage> createState() => _AddPageState();
}


class _AddPageState extends State<AddPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Add a game",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700
              ),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter name",
                hintStyle: TextStyle(
                    color: Colors.blue.withOpacity(0.6),
                    fontFamily: "Georgia"
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                ),
              ),
              style: const TextStyle(
                  color: Colors.blue,
                  fontFamily: "Georgia"
              ),
            ),
            TextField(
              controller: typeController,
              decoration: InputDecoration(
                hintText: "Enter type",
                hintStyle: TextStyle(
                    color: Colors.blue.withOpacity(0.6),
                    fontFamily: "Georgia"
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                ),
              ),
              style: const TextStyle(
                  color: Colors.blue,
                  fontFamily: "Georgia"
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print(nameController.text);
                  print(typeController.text);
                  FirebaseFirestore.instance.collection("games").add(
                    {
                      "name": nameController.text,
                      "type": typeController.text
                    }
                  ).then((value) {
                    print("Successfully added the game");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(title: 'Home Page')),
                    );
                  }).catchError((error) {
                    print("Failed to added the game");
                    print(error.toString());
                  });


                },
                child: Text("Add Game")
            )

          ],
        )
    );
  }
}