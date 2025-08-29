import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resep_koki/Models/ChefProvider.dart';
import 'package:resep_koki/Models/selamatDatangPage.dart'; 

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ChefProvider(), 
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider( 
      providers: [
        ChangeNotifierProvider(create: (_) => ChefProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SelamatDatang(),
      ),
    );
  }
}
