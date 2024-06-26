import 'package:flutter/material.dart';
import 'package:resep_koki/Models/chatOpenAi.dart';
import 'resepCamilan.dart';
import 'resepMinuman.dart';
import 'resepOlahanDaging.dart';
import 'resepOlahanKue.dart';

class HalamanAwal extends StatelessWidget {
  const HalamanAwal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF393737),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        centerTitle: true,
        title: const Text(
          'RESEP KOKI',
          style: TextStyle(
            fontFamily: 'Acme',
            fontSize: 40,
            color: Color(0xFFC96F06),
          ),
        ),
        leading: Image.asset('lib/assets/LOGOO.jpg'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(
                Icons.chat,
                size: 40,
                color: Color.fromARGB(255, 0, 16, 1),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyForm()),
                );
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: Image.asset(
                'lib/assets/background deskripsi.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            top: 40,
            left: 17,
            right: 17,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hallo sahabat koki,',
                  style: TextStyle(
                    fontFamily: 'Acme',
                    fontSize: 30,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 20.0,
                        color: Colors.black,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Jadikan masakanmu disukai',
                  style: TextStyle(
                    fontFamily: 'Acme',
                    fontSize: 30,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 20.0,
                        color: Colors.black,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'semua orang bersama' ' ',
                      style: TextStyle(
                        fontFamily: 'Acme',
                        fontSize: 30,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 20.0,
                            color: Colors.black,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'RESEP KOKI',
                      style: TextStyle(
                        fontFamily: 'IrishGrover',
                        fontSize: 30,
                        color: Color(0xFFC96F06),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 240,
            left: 17,
            right: 17,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kategori Masakan',
                  style: TextStyle(
                    fontFamily: 'Acme',
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 27),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: 
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResepOlahanDaging()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 95, vertical: 25),
                      minimumSize: const Size(300, 50),
                      primary: Color.fromARGB(255, 175, 173, 173),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                    ),
                    child: const Text(
                      'Resep Olahan Daging',
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Acme',
                          color: Color.fromARGB(229, 56, 37, 37)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResepOlahanKue()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 115, vertical: 25),
                      primary: Color.fromARGB(255, 175, 173, 173),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                    ),
                    child: const Text(
                      'Resep Olahan Kue',
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Acme',
                          color: Color.fromARGB(229, 56, 37, 37)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ResepCamilan()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 135, vertical: 25),
                      primary: Color.fromARGB(255, 175, 173, 173),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                    ),
                    child: const Text(
                      'Resep Camilan',
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Acme',
                          color: Color.fromARGB(229, 56, 37, 37)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ResepMinuman()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 125, vertical: 25),
                      primary: Color.fromARGB(255, 175, 173, 173),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                    ),
                    child: const Text(
                      'Resep Minuman',
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Acme',
                          color: Color.fromARGB(229, 56, 37, 37)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
