import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const Deezcent());
}

class Deezcent extends StatelessWidget {
  const Deezcent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testim',
      theme: ThemeData(fontFamily: 'Circular'),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(title: const Text('Testing font ciruclar')),
      body: const Center(
        child: Text('lmaooooooooooooooooooo')
      ),
    )
  }
}
