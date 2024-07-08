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
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust font sizes based on screen width
    double titleFontSize = screenWidth * 0.08;  // ~8% of screen width
    double buttonFontSize = screenWidth * 0.06; // ~6% of screen width
    double textFontSize = screenWidth * 0.05;   // ~5% of screen width

    return Scaffold(
      backgroundColor: const Color(0xFF393737),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        centerTitle: true,
        title: Text(
          'RESEP KOKI',
          style: TextStyle(
            fontFamily: 'Acme',
            fontSize: titleFontSize,
            color: const Color(0xFFC96F06),
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
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      'Hallo sahabat koki,',
                      style: TextStyle(
                        fontFamily: 'Acme',
                        fontSize: textFontSize,
                        color: Colors.white,
                        shadows: const [
                          Shadow(
                            blurRadius: 20.0,
                            color: Colors.black,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Jadikan masakanmu disukai',
                      style: TextStyle(
                        fontFamily: 'Acme',
                        fontSize: textFontSize,
                        color: Colors.white,
                        shadows: const [
                          Shadow(
                            blurRadius: 20.0,
                            color: Colors.black,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'semua orang bersama ',
                          style: TextStyle(
                            fontFamily: 'Acme',
                            fontSize: textFontSize,
                            color: Colors.white,
                            shadows: const [
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
                            fontSize: textFontSize,
                            color: const Color(0xFFC96F06),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Kategori Masakan',
                      style: TextStyle(
                        fontFamily: 'Acme',
                        fontSize: textFontSize,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        _buildCategoryButton(
                          context,
                          'Resep Olahan Daging',
                          const ResepOlahanDaging(),
                          const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          buttonFontSize,
                        ),
                        const SizedBox(height: 20),
                        _buildCategoryButton(
                          context,
                          'Resep Olahan Kue',
                          const ResepOlahanKue(),
                          const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                          buttonFontSize,
                        ),
                        const SizedBox(height: 20),
                        _buildCategoryButton(
                          context,
                          'Resep Camilan',
                          const ResepCamilan(),
                          const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                          buttonFontSize,
                        ),
                        const SizedBox(height: 20),
                        _buildCategoryButton(
                          context,
                          'Resep Minuman',
                          const ResepMinuman(),
                          const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                          buttonFontSize,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(
      BuildContext context, String title, Widget page, EdgeInsets padding, double fontSize) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: padding, backgroundColor: const Color.fromARGB(255, 175, 173, 173),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Acme',
            color: const Color.fromARGB(229, 56, 37, 37),
          ),
        ),
      ),
    );
  }
}
