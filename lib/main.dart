import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const Deezcent());
}

class Deezcent extends StatelessWidget {
  const Deezcent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Circular'),
      home: const LoginScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ini nantinya jadi home')),
      body: const Center(
          child: Text(
        'Welcome Home!',
        style: TextStyle(
          fontSize: 25,
        ),
      )),
    );
  }
}
