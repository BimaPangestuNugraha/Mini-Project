import 'package:flutter_test/flutter_test.dart';
import 'package:resep_koki/Models/selamatDatangPage.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Testing SelamatDatang Widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SelamatDatang()));

    expect(find.text('SELAMAT DATANG'), findsOneWidget);
    expect(find.text('DI'), findsOneWidget);
    expect(find.text('RESEP KOKI'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'MULAI'), findsOneWidget);

  });
}
