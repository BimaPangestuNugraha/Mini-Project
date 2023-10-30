import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class IsiResepAyamWoku extends StatefulWidget {
  const IsiResepAyamWoku({Key? key}) : super(key: key);

  @override
  _IsiResepAyamWokuState createState() => _IsiResepAyamWokuState();
}

class _IsiResepAyamWokuState extends State<IsiResepAyamWoku> {
  Map<String, dynamic>? resepData;
  TextEditingController nameController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  List<Map<String, String>> userReviews = [];

  int? editingIndex; // Menyimpan indeks ulasan yang sedang diedit

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    Dio dio = Dio();
    String url = 'https://653a5019e3b530c8d9e97bc1.mockapi.io/ResepOlahanDaging/4/IsiResepMasakan';

    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        setState(() {
          resepData = Map<String, dynamic>.from(response.data[0]);
        });
      } else {
        print('Gagal mengambil data. StatusCode: ${response.statusCode}');
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
    }
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
      backgroundColor: Color(0xFF393737),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 175, 173, 173),
        title: Text(resepData?['namaMasakan'] ?? 'Resep Tidak Ditemukan',
        style: TextStyle(
      fontFamily: 'Acme',
      color: Colors.black, 
    ),
        ),
      ),
      body: resepData != null
          ? SingleChildScrollView(
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
                    SizedBox(height: 16),
                    Text('Bahan-bahan:'),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: (resepData?['bahan'] as List<dynamic>).map((bahan) {
                          return ListTile(
                            title: Text(bahan.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Langkah Pembuatan:'),
                    Column(
                      children: (resepData?['langkahPembuatan'] as List<dynamic>).map((langkah) {
                        return Text(langkah.toString());
                      }).toList(),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: 200.0,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(255, 251, 250, 250)),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        children: [
                          Text('Nama:'),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Masukkan nama Anda',
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: const Color.fromARGB(255, 245, 245, 245)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: const Color.fromARGB(255, 253, 252, 252)),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text('Ulasan:'),
                          TextField(
                            controller: reviewController,
                            decoration: InputDecoration(
                              hintText: 'Masukkan ulasan Anda',
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: const Color.fromARGB(255, 245, 245, 245)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: const Color.fromARGB(255, 253, 252, 252)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: submitReview,
                      child: Text(editingIndex != null ? 'Perbarui Ulasan' : 'Kirim Ulasan'),
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: userReviews.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 200.0,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromARGB(255, 251, 250, 250)),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Nama: ${userReviews[index]['name']}'),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          editReview(index); 
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          setState(() {
                                            userReviews.removeAt(index);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                'Ulasan: ${userReviews[index]['review']}',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
