import 'package:flutter/material.dart';

// sceens
import 'package:tracovid/screens/loading_screen.dart';

void main() => runApp(Tracovid());

class Tracovid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
