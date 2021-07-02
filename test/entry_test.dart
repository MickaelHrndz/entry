import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:entry/entry.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  /// custom function to wrap [WidgetTester.pumpWidget]
  Future<void> pumpEntry(WidgetTester tester, Entry entry) =>
      tester.pumpWidget(MaterialApp(home: entry), Duration(seconds: 1));

  testWidgets('default constructor', (tester) async {
    await pumpEntry(tester, Entry(child: Text('test')));
    expect(find.text('test'), findsOneWidget);
  });

  testWidgets('fade constructor', (tester) async {
    await pumpEntry(tester, Entry.opacity(child: Text('test')));
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

  testWidgets('default values are used when not specified', (tester) async {
    await tester.pumpWidget(Entry(child: FlutterLogo()));
    //tester.idle();
    var entry = tester.widget<Entry>(find.byType(Entry));
    expect(entry.delay, Duration.zero);
    expect(entry.duration, Duration(milliseconds: 300));
    expect(entry.curve, Curves.ease);
    expect(entry.opacity, 1);
    expect(entry.scale, 1);
    expect(entry.xOffset, 0);
    expect(entry.yOffset, 0);
    expect(entry.angle, 0);
  });

  testWidgets('assertion error if opacity is out of bounds', (tester) async {
    // opacity < 0 throws assertion error
    expect(
        () async =>
            await tester.pumpWidget(Entry(opacity: -1, child: FlutterLogo())),
        throwsAssertionError);

    // opacity > 1 throws assertion error
    expect(
        () async =>
            await tester.pumpWidget(Entry(opacity: 1.01, child: FlutterLogo())),
        throwsAssertionError);
  });
}
