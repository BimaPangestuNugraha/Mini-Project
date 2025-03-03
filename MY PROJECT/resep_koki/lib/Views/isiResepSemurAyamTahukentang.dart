import 'package:flutter/material.dart';

class IsiResepSemurAyamTahuKentang extends StatefulWidget {
  const IsiResepSemurAyamTahuKentang({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IsiResepSemurAyamTahuKentangState createState() =>
      _IsiResepSemurAyamTahuKentangState();
}

class _IsiResepSemurAyamTahuKentangState
    extends State<IsiResepSemurAyamTahuKentang> {
  Map<String, dynamic>? resepData = {
    'namaMasakan': 'Semur Ayam Tahu Kentang',
    'avatar':
        'https://th.bing.com/th/id/R.e9cd2f96c3e83c39077b67e1c769ba6b?rik=2C2jGa1oXd4FHA&riu=http%3a%2f%2fbennydoro.com%2fchef%2fwp-content%2fuploads%2fsites%2f3%2f2018%2f02%2f24c081010ee63f05f098b8a0c6229201.jpeg&ehk=H%2f7UwjnEdFFbHO0OP9JBYfany3WFGAYC8fgWVVkr4MI%3d&risl=&pid=ImgRaw&r=0', // URL gambar semur ayam tahu kentang (ganti sesuai kebutuhan)
    "bahan": [
      "ayam potong sesuai selera",
      "tahu potong kotak",
      "kentang potong dadu",
      "bumbu dapur (merica, garam, dsb.)",
      "kecap manis",
      "saus tomat",
      "gula pasir",
      "bawang merah",
      "bawang putih",
      "jahe",
      "daun salam",
      "serai",
      "air secukupnya"
    ],
    "langkahPembuatan": [
      "Tumis bawang merah, bawang putih, jahe, daun salam, dan serai hingga harum.",
      "Masukkan potongan ayam, tumis hingga berubah warna.",
      "Tambahkan tahu dan kentang, aduk rata.",
      "Tuangkan air secukupnya, masak hingga ayam dan kentang matang.",
      "Tambahkan kecap manis, saus tomat, gula pasir, dan bumbu dapur.",
      "Masak hingga bumbu meresap dan kuah mengental.",
      "Angkat dan sajikan."
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
