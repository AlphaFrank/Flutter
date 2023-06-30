import 'package:flutter/material.dart';
import 'package:example/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              "Signup",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Enter username",
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
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter password",
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
                  print(usernameController.text);
                  print(passwordController.text);
                  Future<UserCredential> ucFuture = FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: usernameController.text, password: passwordController.text);

                  ucFuture.then((value) {
                    print("Successfully signup");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(title: 'Home Page')),
                    );
                  });
                  ucFuture.catchError((error){
                    print("Failed to signup");
                    print(error.toString());
                  });
                },
                child: Text("Signup")
            )

          ],
        )
    );
  }


}