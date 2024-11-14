import 'package:flutter/material.dart';
import 'counter.controller.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> with CounterController {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Count: $counter',
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                incrementCounter();
              });
            },
            child: const Text('Increment'),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                decrementCounter();
              });
            },
            child: const Text('Decrement'),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                resetCounter();
              });
            },
            child: const Text('Reset'),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                doubleCounter();
              });
            },
            child: const Text('Double'),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                halfCounter();
              });
            },
            child: const Text('Half'),
          ),
        ],
      ),
    );
  }
}
