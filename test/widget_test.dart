import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('portfolio home renders core sections', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text('Qusai Jamous'), findsNWidgets(2));
    expect(
      find.text('Flutter developer building production mobile apps.'),
      findsOneWidget,
    );
    await tester.scrollUntilVisible(
      find.text('Selected work'.toUpperCase()),
      500,
      scrollable: find.byType(Scrollable),
    );

    expect(find.text('Selected work'.toUpperCase()), findsOneWidget);
    await tester.scrollUntilVisible(
      find.textContaining('qqjamous12@gmail.com'),
      500,
      scrollable: find.byType(Scrollable),
    );

    expect(find.textContaining('qqjamous12@gmail.com'), findsOneWidget);
  });
}
