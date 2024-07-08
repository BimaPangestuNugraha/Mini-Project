import 'package:flutter/material.dart';

class IsiResepAyamWoku extends StatefulWidget {
  const IsiResepAyamWoku({Key? key}) : super(key: key);

  @override
  _IsiResepAyamWokuState createState() => _IsiResepAyamWokuState();
}

class _IsiResepAyamWokuState extends State<IsiResepAyamWoku> {
  Map<String, dynamic>? resepData = {
    'namaMasakan': 'Ayam Woku',
    'avatar':
            "https://th.bing.com/th/id/OIP.Mzw8z7Rd1tesgDFb6OtADAAAAA?rs=1&pid=ImgDetMain", 
    "bahan": [
      "1 ekor ayam, potong menjadi bagian-bagian sesuai selera",
      "2 lembar daun salam",
      "2 batang serai, memarkan",
      "3 lembar daun jeruk",
      "3 buah cabai merah besar, buang bijinya dan iris tipis",
      "5 buah cabai rawit (atau sesuai selera), iris tipis",
      "3 cm jahe, iris tipis",
      "3 cm lengkuas, memarkan",
      "5 butir bawang merah, iris tipis",
      "3 siung bawang putih, iris tipis",
      "1 sendok makan terasi bakar",
      "1 sendok makan air asam jawa",
      "1 sendok makan gula merah, sisir halus",
      "Garam secukupnya",
      "Air secukupnya"
    ],
    "langkahPembuatan": [
      "Panaskan minyak dalam wajan, tumis bawang merah dan bawang putih hingga harum.",
      "Masukkan lengkuas, jahe, daun salam, serai, dan daun jeruk. Tumis hingga harum.",
      "Tambahkan ayam, aduk hingga berubah warna.",
      "Masukkan terasi, cabai merah, cabai rawit, dan gula merah. Aduk rata.",
      "Tambahkan air asam jawa, aduk kembali hingga bumbu meresap.",
      "Tuangkan air secukupnya, masak hingga ayam matang dan kuah mengental.",
      "Koreksi rasanya dengan garam sesuai selera.",
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
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFD9D9D9),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Masukkan Ulasan Anda',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Acme',
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Masukkan nama Anda',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        if (nameController.text.isEmpty)
                          const Text(
                            'Nama tidak boleh kosong !',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: reviewController,
                          decoration: const InputDecoration(
                            labelText: 'Masukkan ulasan Anda ',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        if (reviewController.text.isEmpty)
                          const Text(
                            'Ulasan tidak boleh kosong !',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: submitReview,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD9D9D9),
                  ),
                  child: Text(
                    editingIndex != null ? 'Perbarui' : 'Kirim',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: userReviews.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFFD9D9D9),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nama : ${userReviews[index]['name']}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    editReview(index);
                                  },
                                  child: const Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      userReviews.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Ulasan : ${userReviews[index]['review']}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
