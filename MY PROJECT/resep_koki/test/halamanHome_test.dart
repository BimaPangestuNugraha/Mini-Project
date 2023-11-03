import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resep_koki/ViewModel/halamanHome.dart';

void main() {
  testWidgets('Menguji Widget HalamanAwal', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HalamanAwal()));

    final widgets = find.text("RESEP KOKI");
    expect(widgets, findsNWidgets(2));

    expect(find.byIcon(Icons.chat), findsOneWidget);
    expect(find.text('Kategori Masakan'), findsOneWidget);
    expect(find.text('Hallo sahabat koki,'), findsOneWidget);
    expect(find.text('Jadikan masakanmu disukai'), findsOneWidget);
    expect(find.text('Semua orang bersama RESEP KOKI'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNWidgets(5));
  });
}
