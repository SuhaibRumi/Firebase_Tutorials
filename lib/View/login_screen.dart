import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorials/View/signup_screen.dart';
import 'package:firebase_tutorials/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop:false,
     onPopInvoked:(didPop){
       SystemNavigator.pop();
     },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 5,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            "Login",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/login.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Welcome",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // TextField for email..//
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: "Enter Your Email",
                              prefixIcon: Icon(Icons.mail),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'User name connot be empty';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          // TextField for password..//
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            obscuringCharacter: "*",
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye),
                                hintText: "Enter Your Password",
                                prefixIcon: Icon(Icons.lock)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password connot be empty';
                              } else if (value.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // reuseableButton//

                          RoundedButton(
                              title: 'Login',
                              onTap: () {
                                _auth
                                    .createUserWithEmailAndPassword(
                                        email: _emailController.text.toString(),
                                        password:
                                            _passwordController.text.toString())
                                    .then((value) {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) => const HomeScreen()));
                                }).onError((error, stackTrace) {
                                  Utils().tosterMessage(error.toString());
                                });
                                if (_formKey.currentState!.validate()) {}
                              }),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Do you have not Account? "),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const SignUpScreen()));
                                },
                                child: const Text(
                                  "Sign Up ",
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
