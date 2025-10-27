// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:quotes/main.dart';

void main() {
  testWidgets('Quotes app renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const QuotesApp(isDark: false));

    // Verify that the random button exists
    expect(find.text('Random'), findsOneWidget);
    
    // Verify that the daily button exists
    expect(find.text('Daily'), findsOneWidget);
  });
}
