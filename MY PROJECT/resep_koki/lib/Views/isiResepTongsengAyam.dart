// ignore: file_names
import 'package:flutter/material.dart';

class IsiResepTongsengAyam extends StatefulWidget {
  const IsiResepTongsengAyam({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IsiResepTongsengAyamState createState() => _IsiResepTongsengAyamState();
}

class _IsiResepTongsengAyamState extends State<IsiResepTongsengAyam> {
  Map<String, dynamic>? resepData = {
    'namaMasakan': 'Tongseng Ayam',
    'avatar':
        'https://ecs7.tokopedia.net/blog-tokopedia-com/uploads/2021/07/3.-Resep-Tongseng-Ayam-Tanpa-Santan.jpg', // URL gambar tongseng ayam (ganti sesuai kebutuhan)
    "bahan": [
      "1 ekor ayam, potong menjadi bagian-bagian sesuai selera",
      "200 gram kentang, potong dadu",
      "100 gram wortel, potong dadu",
      "3 lembar daun jeruk",
      "2 batang serai, memarkan",
      "2 lembar daun salam",
      "200 ml santan",
      "2 sendok makan kecap manis",
      "Garam dan gula secukupnya",
      "Air secukupnya",
      "Minyak untuk menumis"
    ],
    "langkahPembuatan": [
      "Panaskan minyak dalam wajan, tumis daun salam, daun jeruk, dan serai hingga harum.",
      "Masukkan potongan ayam, tumis hingga berubah warna.",
      "Tambahkan kentang dan wortel, aduk rata.",
      "Tuangkan air secukupnya, masak hingga ayam dan sayuran setengah matang.",
      "Tambahkan santan, kecap manis, garam, dan gula. Aduk rata dan masak hingga bumbu meresap dan kuah mengental.",
      "Koreksi rasa jika diperlukan.",
      "Angkat dan sajikan selagi hangat."
    ]
  };

  TextEditingController nameController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  List<Map<String, String>> userReviews = [];

  int? editingIndex;

  @override
  void initState() {
    super.initState();
  }

  void submitReview() {
    String name = nameController.text;
    String userReview = reviewController.text;
    if (name.isNotEmpty && userReview.isNotEmpty) {
      if (editingIndex != null) {
        setState(() {
          userReviews[editingIndex!] = {
            'name': name,
            'review': userReview,
          };
          editingIndex = null;
        });
      } else {
        setState(() {
          userReviews.add({
            'name': name,
            'review': userReview,
          });
        });
      }
      nameController.clear();
      reviewController.clear();
    }
  }

  void editReview(int index) {
    setState(() {
      nameController.text = userReviews[index]['name'] ?? '';
      reviewController.text = userReviews[index]['review'] ?? '';
      editingIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF393737),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 175, 173, 173),
        title: Text(
          resepData?['namaMasakan'] ?? 'Resep Tidak Ditemukan',
          style: const TextStyle(
            fontFamily: 'Acme',
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    resepData?['avatar'] ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFC96F06),
                ),
                child: const Text(
                  'Bahan-bahan:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Acme',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFD9D9D9),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (resepData?['bahan'] as List<dynamic>)
                      .asMap()
                      .entries
                      .map((entry) {
                    int index = entry.key;
                    dynamic bahan = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}.',
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Acme',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              bahan.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Acme',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFC96F06),
                ),
                child: const Text(
                  'Langkah Pembuatan:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Acme',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFD9D9D9),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (resepData?['langkahPembuatan'] as List<dynamic>)
                      .asMap()
                      .entries
                      .map((entry) {
                    int index = entry.key;
                    dynamic langkah = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}.',
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Acme',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              langkah.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Acme',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
