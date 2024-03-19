import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resep_koki/ViewModel/resepOlahanDaging.dart';
import 'package:resep_koki/Views/isiResepSemurAyamTahukentang.dart';

void main() {
  testWidgets('Test tampilan awal ResepOlahanDaging', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ResepOlahanDaging()));

    // Mengecek apakah judul, ikon, dan daftar loading muncul
    expect(find.text('Resep Olahan Daging'), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Test pindah ke halaman resep saat men-tap item', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ResepOlahanDaging()));

    // Menekan item pertama dalam daftar
    await tester.tap(find.text('Nama Resep 1')); // Sesuaikan dengan teks yang sesuai di daftar

    // Menunggu perpindahan halaman
    await tester.pumpAndSettle();

    // Mengecek apakah telah pindah ke halaman resep yang sesuai
    expect(find.byType(IsiResepSemurAyamTahuKentang), findsOneWidget); // Sesuaikan dengan halaman yang sesuai
  });

  testWidgets('Test membuat item baru', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ResepOlahanDaging()));

    // Menekan tombol "Tambah Item" (Pastikan tombol ini ada di tampilan Anda)
    await tester.tap(find.byIcon(Icons.add)); // Sesuaikan dengan ikon atau teks yang sesuai di tampilan Anda

    // Menunggu perpindahan halaman (jika ada)
    await tester.pumpAndSettle();

    // Mengecek apakah telah pindah ke halaman pembuatan item baru
    expect(find.text('Form Pembuatan Item Baru'), findsOneWidget); // Sesuaikan dengan judul halaman tersebut
  });

  testWidgets('Test mengedit item', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ResepOlahanDaging()));

    // Menekan tombol "Edit" (Pastikan tombol ini ada di tampilan Anda)
    await tester.tap(find.byIcon(Icons.edit)); // Sesuaikan dengan ikon atau teks yang sesuai di tampilan Anda

    // Menunggu perpindahan halaman (jika ada)
    await tester.pumpAndSettle();

    // Mengecek apakah telah pindah ke halaman pengeditan item
    expect(find.text('Form Edit Item'), findsOneWidget); // Sesuaikan dengan judul halaman tersebut
  });

  testWidgets('Test menghapus item', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ResepOlahanDaging()));

    // Menekan tombol "Hapus" (Pastikan tombol ini ada di tampilan Anda)
    await tester.tap(find.byIcon(Icons.delete)); // Sesuaikan dengan ikon atau teks yang sesuai di tampilan Anda

    // Menunggu konfirmasi penghapusan (jika ada)
    await tester.pumpAndSettle();

    // Mengecek apakah konfirmasi penghapusan muncul
    expect(find.text('Anda yakin ingin menghapus item ini?'), findsOneWidget); // Sesuaikan dengan teks konfirmasi
  });
}
