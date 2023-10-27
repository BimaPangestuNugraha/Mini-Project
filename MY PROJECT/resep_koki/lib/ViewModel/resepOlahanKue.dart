import 'package:flutter/material.dart';

class ResepOlahanKue extends StatefulWidget {
  const ResepOlahanKue({super.key});

  @override
  State<ResepOlahanKue> createState() => _ResepOlahanKueState();
}

class _ResepOlahanKueState extends State<ResepOlahanKue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF393737),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        centerTitle: true,
        title: Text(
          'Resep Olahan Kue',
          style: TextStyle(
            fontFamily: 'Acme', 
            fontSize: 30,
            color: Color(0xFFC96F06),
          ),
        ),
        leading: Image.asset('lib/assets/LOGOO.jpg'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(
                Icons.chat,
                size: 40,
                color: Color.fromARGB(255, 0, 16, 1),
              ),
              onPressed: () {
                // Tindakan yang akan diambil saat tombol chat diklik
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat datang di Resep Olahan Kue',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Tindakan yang akan diambil saat tombol ditekan
              },
              child: Text('Tombol Contoh'),
            ),
            // Tambahkan konten lainnya di sini
          ],
        ),
      ),
    );
  }
}
