import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart'; 
import 'package:resep_koki/ViewModel/halamanHome.dart';


void main() {
  testWidgets('Test HalamanAwal widget', (WidgetTester tester) async {
   
    await tester.pumpWidget(MaterialApp(home: HalamanAwal()));

   
    expect(find.text('RESEP KOKI'), findsOneWidget);
    expect(find.text('Kategori Masakan'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNWidgets(1)); 
  });
}
