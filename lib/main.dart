import 'package:flutter/material.dart';
import 'package:startup_namer/home.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "this ?",
      home: Home(),
    );
  }
}
