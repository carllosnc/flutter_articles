import 'package:flutter/material.dart';
import './extensions.dart';
import './counter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: "Home Page" //
              .text
              .bold
              .fontSize(16)
              .uppercase
              .color(Colors.red)
              .letterSpacing(2)
              .center,
        ),
        body: const Center(
          child: Counter(),
        ),
      ),
    );
  }
}
