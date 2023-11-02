import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class IsiResepSateSapi extends StatefulWidget {
  const IsiResepSateSapi({Key? key}) : super(key: key);

  @override
  _IsiResepSateSapiState createState() => _IsiResepSateSapiState();
}

class _IsiResepSateSapiState extends State<IsiResepSateSapi> {
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
    String url =
        'https://653a5019e3b530c8d9e97bc1.mockapi.io/ResepOlahanDaging/2/IsiResepMasakan';

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

  bool nameError = false;
  bool reviewError = false;

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
      setState(() {
        nameError = false;
        reviewError = false;
      });
    } else {
      // Validasi form ulasan
      setState(() {
        nameError = name.isEmpty;
        reviewError = userReview.isEmpty;
      });
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
        title: Text(
          resepData?['namaMasakan'] ?? 'Resep Tidak Ditemukan',
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
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFFC96F06),
                      ),
                      child: Text(
                        'Bahan-bahan:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Acme',
                        ),
                      ),
                    ),
                    Container(
                      width: double
                          .infinity,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFFD9D9D9),
                      ),
                      child: Column(
                        children: (resepData?['bahan'] as List<dynamic>)
                            .map((bahan) {
                          return ListTile(
                            title: Text(
                              bahan.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Acme',
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double
                          .infinity,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFFC96F06),
                      ),
                      child: Text(
                        'Langkah Pembuatan:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Acme',
                        ),
                      ),
                    ),
                    Container(
                      width: double
                          .infinity,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFFD9D9D9),
                      ),
                      child: Column(
                        children: (resepData?['langkahPembuatan'] as List<dynamic>)
                            .map((langkah) {
                          return Text(
                            langkah.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Acme',
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double
                          .infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFFD9D9D9),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
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
                          SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  labelText: 'Masukkan nama Anda',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              if (nameError)
                                Text(
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
                                decoration: InputDecoration(
                                  labelText: 'Masukkan ulasan Anda ',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              if (reviewError)
                                Text(
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
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: submitReview,
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFD9D9D9),
                        ),
                        child: Text(
                          editingIndex != null ? 'Perbarui' : 'Kirim',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: userReviews.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFFD9D9D9),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Nama : ${userReviews[index]['name']}',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          editReview(index);
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          size: 20,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            userReviews.removeAt(index);
                                          });
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Ulasan : ${userReviews[index]['review']}',
                                style: TextStyle(
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
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
