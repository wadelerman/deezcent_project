// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:deezcent_project/common/button_widget.dart';
import 'package:deezcent_project/services/auth.dart';

import '../../../shared/loading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  //text controller
  // final AuthService _auth = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;

  Future signIn() async {
    try {
      setState(() {
        loading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } catch (error) {
      setState(() {
        loading = false;
      });
      return null;
    }
  }

//memory management
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.grey[200],
            body: SafeArea(
                child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.flash_on_outlined,
                      size: 75,
                      color: Colors.teal[600],
                    ),

                    SizedBox(height: 20),
                    Text(
                      'Welcome back!',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    //Top Subtitle text
                    Center(
                      child: Text(
                        'Silahkan isi email dan password untuk login',
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    //Login innput box
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ),
                    ),

                    //password input box
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ),
                    ),

                    //login button
                    SizedBox(height: 20),
                    loginButton(),
                    //forgot password text
                    SizedBox(height: 20),
                    Center(child: Text('Lupa Password?')),
                  ],
                ),
              ),
            )),
          );
  }

  Widget loginButton() => Builder(
        builder: (context) => ButtonWidget("Login", 0, signIn),
      );
}
