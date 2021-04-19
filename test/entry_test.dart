import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:entry/entry.dart';

void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  /// custom function to wrap [WidgetTester.pumpWidget]
  Future<void> pumpEntry(WidgetTester tester, Entry Entry) => 
    tester.pumpWidget(
      MaterialApp(
        home: Entry
      ), 
      Duration(seconds: 1)
  );

  testWidgets('default constructor', (tester) async {
    await pumpEntry(tester, Entry(child: Text('test')));
    expect(find.text('test'), findsOneWidget);
  });

  testWidgets('fade constructor', (tester) async {
    await pumpEntry(tester, Entry.alpha(child: Text('test')));
    expect(find.text('test'), findsOneWidget);
  });

  testWidgets('grow constructor', (tester) async {
    await pumpEntry(tester, Entry.scale(child: Text('test')));
    expect(find.text('test'), findsOneWidget);
  });

  testWidgets('move constructor', (tester) async {
    await pumpEntry(tester, Entry.offset(child: Text('test')));
    expect(find.text('test'), findsOneWidget);
  });
}
