import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('portfolio home renders core sections', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text('Flutter Mobile Application Developer'), findsOneWidget);
    expect(find.text('Download CV'), findsWidgets);
    expect(find.text('Contact Me'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('About Me'.toUpperCase()),
      500,
      scrollable: find.byType(Scrollable),
    );

    expect(find.text('About Me'.toUpperCase()), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('E-commerce App'),
      500,
      scrollable: find.byType(Scrollable),
    );

    expect(find.text('E-commerce App'), findsWidgets);

    await tester.scrollUntilVisible(
      find.textContaining('qqjamous12@gmail.com'),
      500,
      scrollable: find.byType(Scrollable),
    );

    expect(find.textContaining('qqjamous12@gmail.com'), findsOneWidget);
  });
}
