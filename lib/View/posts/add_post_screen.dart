import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_tutorials/utils/utils.dart';
import 'package:firebase_tutorials/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref("Post");
  final postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: postController,
              decoration: InputDecoration(
                  hintText: ("What's in your mind ?"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundedButton(
                title: "Add",
                loading: loading,
                onTap: () {
                  setState(() {
                    loading = true;
                  });
                  databaseRef.child("Hi").set({
                    "desc": postController.text.toString(),
                    "id": 1
                  }).then((value) {
                    setState(() {
                      loading = false;
                    });
                    Utils().tosterMessage("Post has been added");
                  }).onError((error, stackTrace) {
                    Utils().tosterMessage(error.toString());
                    setState(() {
                      loading = false;
                    });
                  });
                })
          ],
        ),
      ),
    );
  }
}
