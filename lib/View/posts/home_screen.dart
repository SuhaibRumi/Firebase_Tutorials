import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorials/View/auth/auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text("Home "),
          actions: [
            IconButton(
                onPressed: () {
                  auth.signOut().then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()));
                  });
                },
                icon: const Icon(Icons.logout_rounded))
          ],
        ),
        body: Container(
          color: Colors.grey[100],
          child: const Center(
              child: Text(
            "Welcome",
            style: TextStyle(fontSize: 20),
          )),
        ));
  }
}
