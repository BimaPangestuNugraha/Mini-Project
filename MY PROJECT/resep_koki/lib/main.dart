import 'package:flutter/material.dart';
import 'package:resep_koki/Models/selamatDatangPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelamatDatang(),
    );
  }
}