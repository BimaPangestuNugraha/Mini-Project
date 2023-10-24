import 'package:flutter/material.dart';
import 'package:resep_koki/screens/selamatDatangPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelamatDatang(),
    );
  }
}