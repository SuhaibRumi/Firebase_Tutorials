import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorials/View/login_screen.dart';
import 'package:firebase_tutorials/utils/utils.dart';
import 'package:firebase_tutorials/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: const Text(
          "Sign Up",
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
                  "assets/images/signup.png",
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Welcome Sign Up",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: "Enter Your Name",
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                            title: 'Sign Up',
                            loading: loading,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  loading = true;
                                });
                              }
                              _auth
                                  .createUserWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text)
                                  .then((value) {
                                setState(() {
                                  loading = false;
                                });

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const LoginScreen()));
                              }).onError((error, stackTrace) {
                                setState(() {
                                  loading = false;
                                });

                                Utils().tosterMessage(error.toString());
                              });
                            })
                      ],
                    )),

                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Do you have already Account "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()));
                      },
                      child: const Text(
                        "LogIn",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
