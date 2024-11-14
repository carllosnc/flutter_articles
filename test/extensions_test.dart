import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_articles/extensions.dart';

void main() {
  group("ColumnExtension", () {
    const column = Column(
      children: [
        Text('foo'),
        Text('bar'),
        Text('span'),
      ],
    );

    test('Check children length', () {
      expect(column.gap(10).children.length, 5);
    });

    test('Check gap keys', () {
      expect(column.gap(10).children[1].key.toString(), const Key("gap-0").toString());
      expect(column.gap(10).children[3].key.toString(), const Key("gap-1").toString());
    });
  });
}
