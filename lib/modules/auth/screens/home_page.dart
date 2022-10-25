// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:deezcent_project/common/button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Signed in as: ${user.email!}'),
          logoutButton(),
        ],
      )),
    );
  }

  Widget logoutButton() => Builder(
        builder: (context) => ButtonWidget(
          "Logout",
          0,
          () => FirebaseAuth.instance.signOut(),
        ),
      );
}
