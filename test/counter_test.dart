import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_articles/counter.controller.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> with CounterController {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

void main() {
  group("Counter", () {
    var state = const Counter().createState() as _CounterState;

    test('check incrementCounter', () {
      expect(state.counter, 0);
      state.incrementCounter();
      state.incrementCounter();
      state.incrementCounter();

      expect(state.counter, 3);
    });

    test('check decrementCounter', () {
      state.decrementCounter();
      state.decrementCounter();
      state.decrementCounter();

      expect(state.counter, 0);
    });

    test('check resetCounter', () {
      state.incrementCounter();
      state.incrementCounter();
      state.incrementCounter();

      state.resetCounter();

      expect(state.counter, 0);
    });

    test('check doubleCounter', () {
      state.incrementCounter();
      state.incrementCounter();
      state.incrementCounter();
      state.doubleCounter();

      expect(state.counter, 6);
    });

    test('check halfCounter', () {
      state.halfCounter();

      expect(state.counter, 3);
    });
  });
}
