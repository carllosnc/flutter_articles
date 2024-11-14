import 'package:flutter/material.dart';

mixin CounterController<T extends StatefulWidget> on State<T> {
  int counter = 0;

  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    counter--;
  }

  void resetCounter() {
    counter = 0;
  }

  void doubleCounter() {
    counter *= 2;
  }

  void halfCounter() {
    counter ~/= 2;
  }
}
