import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';
import 'package:project_to_practice_testing/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets(
      "testing home widget scrolling",
      (widgetTester) async {
        await widgetTester.pumpWidget(MyApp());
        var listFinder = find.byType(Scrollable).first;
        var itemFinder = find.byKey(Key("007"));
        await widgetTester.scrollUntilVisible(
          itemFinder,
          200,
          scrollable: listFinder,
          duration: Duration(seconds: 3),
        );
        // expect(itemFinder, findsAny);
        await Future.delayed(Duration(seconds: 3));
        await widgetTester.tap(itemFinder);

        await Future.delayed(Duration(seconds: 3));

        var doneFinder = find.byType(Text);
        await Future.delayed(Duration(seconds: 3));
        await widgetTester.pumpAndSettle(); //Duration(seconds: 1)
        expect(doneFinder.first, findsOneWidget);
        // await widgetTester.pumpAndSettle();
      },
    );
    // testWidgets('tap on the floating action button, verify counter',
    //     (tester) async {
    //   // Load app widget.

    //   await tester.pumpWidget(const MyApp());

    //   // Verify the counter starts at 0.
    //   expect(find.text('0'), findsOneWidget);

    //   // Finds the floating action button to tap on.
    //   final fab = find.byKey(const ValueKey('increment'));

    //   // Emulate a tap on the floating action button.
    //   await tester.tap(fab);

    //   // Trigger a frame.
    //   await tester.pumpAndSettle();

    //   // Verify the counter increments by 1.
    //   expect(find.text('1'), findsOneWidget);
    // });
  });
}
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';

// import 'package:project_to_practice_testing/main.dart';

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // testWidgets(
  //   "testing home widget finder by key",
  //   (widgetTester) async {
  //     await widgetTester.pumpWidget(MyApp());
  //     var finder = find.byKey(Key("card_key"));
  //     expect(finder, findsOne);
  //   },
  // );
  // testWidgets(
  //   "testing home widget finder by type",
  //   (widgetTester) async {
  //     await widgetTester.pumpWidget(MyApp());
  //     var finder = find.byType(Card);
  //     expect(finder, findsOne);
  //   },
  // );
  // testWidgets(
  //   "testing home widget finder by text",
  //   (widgetTester) async {
  //     await widgetTester.pumpWidget(MyApp());
  //     var finder = find.text('You have pushed the button this many times:');
  //     expect(finder, findsAny);
  //   },
  // );
  // testWidgets(
  //   "testing home widget finder by text",
  //   (widgetTester) async {
  //     await widgetTester.pumpWidget(MyApp());
  //     var finder = find.text('You have pushed the button this many times:');
  //     expect(finder, findsAny);
  //   },
  // );


 
  // testWidgets(
  //   "testing home widget user interactions",
  //   (widgetTester) async {
  //     await widgetTester.pumpWidget(MyApp());
  //     await widgetTester.enterText(find.byType(TextField), 'typing');

  //     var textFinder = find.text("typing");
  //     var buttonFinder = find.byType(FloatingActionButton);
  //     await widgetTester.press(buttonFinder);
  //     // widgetTester.pump();.
  //     expect(textFinder, findsAny);
  //   },
  // );
// }
