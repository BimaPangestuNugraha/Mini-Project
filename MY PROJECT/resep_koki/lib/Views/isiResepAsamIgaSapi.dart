import 'package:flutter/material.dart';

class IsiResepAsamIgaSapi extends StatefulWidget {
  const IsiResepAsamIgaSapi({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IsiResepAsamIgaSapi createState() => _IsiResepAsamIgaSapi();
}

class _IsiResepAsamIgaSapi extends State<IsiResepAsamIgaSapi> {
  Map<String, dynamic>? resepData = {
    'namaMasakan': 'Asam Iga Sapi',
    'avatar':
        'https://th.bing.com/th/id/R.6c42f554ce2e5440838d75f23496e816?rik=zeVEhaTk21NCcA&riu=http%3a%2f%2f1.bp.blogspot.com%2f-_Dr6O9nCZrQ%2fVgAFEvwfNnI%2fAAAAAAAAArU%2fWxVaLJuXlhA%2fs1600%2fresep-pindang-asam-iga-sapi.jpg&ehk=R5R0RsBJh4dXNAFFvyrMAc3knKNziQmk1xkeIvJ4sxo%3d&risl=&pid=ImgRaw&r=0', // URL gambar sate sapi (ganti sesuai kebutuhan)
    "bahan": [
    "iga sapi",
    "bumbu dapur (merica, garam, dsb.)",
    "air secukupnya",
    "bawang merah",
    "bawang putih",
    "jahe",
    "daun jeruk",
    "cabai rawit (opsional)"
  ],
  "langkahPembuatan": [
    "Bersihkan iga sapi dengan baik.",
    "Rebus iga sapi dengan air sampai matang dan empuk. Tiriskan.",
    "Tumis bawang merah, bawang putih, dan jahe hingga harum.",
    "Masukkan iga sapi ke dalam tumisan.",
    "Tambahkan air secukupnya dan masak hingga mendidih.",
    "Masukkan daun jeruk dan cabai rawit (jika digunakan).",
    "Biarkan hingga bumbu meresap dan kuah mengental."
  ]

  };

  TextEditingController nameController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  List<Map<String, String>> userReviews = [];

  int? editingIndex; // Menyimpan indeks ulasan yang sedang diedit

  @override
  void initState() {
    super.initState();
  }

  void submitReview() {
    String name = nameController.text;
    String userReview = reviewController.text;
    if (name.isNotEmpty && userReview.isNotEmpty) {
      if (editingIndex != null) {
        // Jika sedang dalam mode edit, perbarui ulasan
        setState(() {
          userReviews[editingIndex!] = {
            'name': name,
            'review': userReview,
          };
          editingIndex = null; // Keluar dari mode edit
        });
      } else {
        // Jika tidak dalam mode edit, tambahkan ulasan baru
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
