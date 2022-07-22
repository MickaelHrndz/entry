import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:entry/entry.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  /// custom function to wrap [WidgetTester.pumpWidget]
  Future<void> pumpEntry(WidgetTester tester, Entry entry) =>
      tester.pumpWidget(MaterialApp(home: entry), const Duration(seconds: 1));

  const key = Key('testKey');

  testWidgets('default constructor', (tester) async {
    await pumpEntry(tester, Entry(key: key, child: const Text('test')));
    expect(find.byKey(key), findsOneWidget);
    expect(find.text('test'), findsOneWidget);
  });

  testWidgets('all constructor', (tester) async {
    await pumpEntry(tester, Entry.all(key: key, child: const Text('test')));
    expect(find.byKey(key), findsOneWidget);
    expect(find.text('test'), findsOneWidget);
  });

  testWidgets('fade constructor', (tester) async {
    await pumpEntry(tester, Entry.opacity(key: key, child: const Text('test')));
    expect(find.byKey(key), findsOneWidget);
    expect(find.text('test'), findsOneWidget);
  });

  testWidgets('grow constructor', (tester) async {
    await pumpEntry(tester, Entry.scale(key: key, child: const Text('test')));
    expect(find.byKey(key), findsOneWidget);
    expect(find.text('test'), findsOneWidget);
  });

  testWidgets('move constructor', (tester) async {
    await pumpEntry(tester, Entry.offset(key: key, child: const Text('test')));
    expect(find.byKey(key), findsOneWidget);
    expect(find.text('test'), findsOneWidget);
  });

  testWidgets('default values are used when not specified', (tester) async {
    await tester.pumpWidget(Entry(child: const FlutterLogo()));
    //tester.idle();
    var entry = tester.widget<Entry>(find.byType(Entry));
    expect(entry.delay, Duration.zero);
    expect(entry.duration, const Duration(milliseconds: 300));
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
        () async => await tester
            .pumpWidget(Entry(opacity: -1, child: const FlutterLogo())),
        throwsAssertionError);

    // opacity > 1 throws assertion error
    expect(
        () async => await tester
            .pumpWidget(Entry(opacity: 1.01, child: const FlutterLogo())),
        throwsAssertionError);
  });
}
