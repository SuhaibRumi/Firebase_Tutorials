import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorials/View/auth/auth.dart';
import 'package:firebase_tutorials/View/posts/post.dart';
import 'package:firebase_tutorials/utils/utils.dart';
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
                  }).onError((error, stackTrace) {
                    Utils().tosterMessage(error.toString());
                  });
                },
                icon: const Icon(Icons.logout_rounded))
          ],
        ),floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPostScreen()));
        },
      ),
        
        );
  }
}
