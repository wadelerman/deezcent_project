import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressedHandler;

  const ButtonWidget(this.onPressedHandler, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressedHandler,
        child: const Text(''),
      ),
    );
  }
}
