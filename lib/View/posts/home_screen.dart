import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text("Post "),
        ),
        body: Container(
          color: Colors.amber,
          child: const Center(
              child: Text(
            "Welcome",
            style: TextStyle(fontSize: 20),
          )),
        ));
  }
}
