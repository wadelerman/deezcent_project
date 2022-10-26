import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[600],
      child: Center(
        child: SpinKitDoubleBounce(
          color: Colors.amber[50],
          size: 50.0,
        ),
      ),
    );
  }
}
