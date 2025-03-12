import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:entry/entry.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  /// custom function to wrap [WidgetTester.pumpWidget]
  Future<void> pumpEntry(WidgetTester tester, Entry entry) =>
      tester.pumpWidget(MaterialApp(home: entry), duration: const Duration(seconds: 1));

  const key = Key('testKey');

  testWidgets('default constructor', (tester) async {
    await pumpEntry(tester, const Entry(key: key, child: Text('test')));
    expect(find.byKey(key), findsOneWidget);
    expect(find.text('test'), findsOneWidget);
  });

  testWidgets('all constructor', (tester) async {
    await pumpEntry(tester, const Entry.all(key: key, child: Text('test')));
    expect(find.byKey(key), findsOneWidget);
    expect(find.text('test'), findsOneWidget);
  });

  testWidgets('opacity constructor', (tester) async {
    await pumpEntry(tester, const Entry.opacity(key: key, child: Text('test')));
    expect(find.byKey(key), findsOneWidget);
    expect(find.text('test'), findsOneWidget);
  });

  testWidgets('scale constructor', (tester) async {
    await pumpEntry(tester, const Entry.scale(key: key, child: Text('test')));
    expect(find.byKey(key), findsOneWidget);
    expect(find.text('test'), findsOneWidget);
  });

  testWidgets('offset constructor', (tester) async {
    await pumpEntry(tester, const Entry.offset(key: key, child: Text('test')));
    expect(find.byKey(key), findsOneWidget);
    expect(find.text('test'), findsOneWidget);
  });

  testWidgets('default values are used when not specified', (tester) async {
    await tester.pumpWidget(const Entry(child: FlutterLogo()));
    //tester.idle();
    var entry = tester.widget<Entry>(find.byType(Entry));
    expect(entry.delay, Duration.zero);
    expect(entry.duration, const Duration(milliseconds: 300));
    expect(entry.curve, Curves.ease);
    expect(entry.visible, true);
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
