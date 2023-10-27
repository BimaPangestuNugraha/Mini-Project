import 'package:flutter/material.dart';

import '../ViewModel/halamanHome.dart';

class SelamatDatang extends StatefulWidget {
  @override
  State<SelamatDatang> createState() => _SelamatDatangState();
}

class _SelamatDatangState extends State<SelamatDatang> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/Wellcome.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'SELAMAT DATANG',
                  style: TextStyle(
                    fontFamily: 'IrishGrover',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
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
                  'DI',
                  style: TextStyle(
                    fontFamily: 'IrishGrover',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 244, 243, 243),
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
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC96F06), 
                    shadows: [
                      Shadow(
                        blurRadius: 20.0,
                        color: Colors.black,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  
                ),
                SizedBox(height: 13), 
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HalamanAwal()), 
                      );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    primary: Color(0xFFC96F06),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                  ),
                  child: Text('MULAI',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Acme',
                    color: const Color.fromARGB(255, 253, 252, 252)
                  ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
