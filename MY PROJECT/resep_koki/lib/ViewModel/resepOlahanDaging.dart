import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:resep_koki/Models/chatOpenAi.dart';
import 'package:resep_koki/Views/isiResepAsamIgaSapi.dart';
import 'package:resep_koki/Views/isiResepAyamWoku.dart';
import 'package:resep_koki/Views/isiResepSateSapi.dart';
import 'package:resep_koki/Views/isiResepSemurAyamTahukentang.dart';
import 'package:resep_koki/Views/isiResepTongsengAyam.dart';

class ResepOlahanDaging extends StatefulWidget {
  const ResepOlahanDaging({super.key});

  @override
  State<ResepOlahanDaging> createState() => _ResepOlahanDagingState();
}

class _ResepOlahanDagingState extends State<ResepOlahanDaging> {
  List<Map<String, dynamic>> userData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    Dio dio = Dio();
    String url =
        'https://653a5019e3b530c8d9e97bc1.mockapi.io/ResepOlahanDaging';
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        setState(() {
          userData = List<Map<String, dynamic>>.from(response.data);
        });
      } else {
        print('Gagal mengambil data. statusCode: ${response.data}');
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
    }
  }

  void createNewItem() async {
    try {
      Dio dio = Dio();
      String url =
          'https://653a5019e3b530c8d9e97bc1.mockapi.io/ResepOlahanDaging';
      Map<String, dynamic> newItemData = {
        "createdAt": "2023-10-27T12:00:00.000Z",
        "name": "Tumis Kangkung",
        "avatar": "https://bing.com/th?id=OSK.9530b85d9b3e416008dd5c797eb60187"
      };

      Response response = await dio.post(url, data: newItemData);
      if (response.statusCode == 201) {
        print('Item baru "Tumis Kangkung" berhasil dibuat.');
        fetchData();
      } else {
        print('Gagal membuat item baru. Kode status: ${response.statusCode}');
      }
    } catch (error) {
      print('Terjadi kesalahan saat membuat item baru: $error');
    }
  }

  void deleteItem(String itemId) async {
    Dio dio = Dio();
    String url =
        'https://653a5019e3b530c8d9e97bc1.mockapi.io/ResepOlahanDaging/$itemId';

    try {
      Response response = await dio.delete(url);
      if (response.statusCode == 200) {
        print('Item berhasil dihapus');
        fetchData();
      } else {
        print('Gagal menghapus item. Kode status: ${response.statusCode}');
      }
    } catch (error) {
      print('Terjadi kesalahan saat menghapus item: $error');
    }
  }

  void updateItem(String itemId, Map<String, dynamic> newData) async {
    Dio dio = Dio();
    String url =
        'https://653a5019e3b530c8d9e97bc1.mockapi.io/ResepOlahanDaging/$itemId';

    try {
      Response response = await dio.put(url, data: newData);
      if (response.statusCode == 200) {
        print('Item berhasil diperbarui');
        fetchData();
      } else {
        print('Gagal memperbarui item. Kode status: ${response.statusCode}');
      }
    } catch (error) {
      print('Terjadi kesalahan saat memperbarui item: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF393737),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        centerTitle: true,
        title: const Text(
          'Resep Olahan Daging',
          style: TextStyle(
            fontFamily: 'Acme',
            fontSize: 30,
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
      body: userData.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const IsiResepSemurAyamTahuKentang(),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const IsiResepSateSapi(),
                          ),
                        );
                      } else if (index == 2) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const IsiResepTongsengAyam(),
                          ),
                        );
                      } else if (index == 3) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const IsiResepAyamWoku(),
                          ),
                        );
                      } else if (index == 4) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const IsiResepAsamIgaSapi(),
                          ),
                        );
                      }
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: NetworkImage(userData[index]['avatar']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            //  color: Color(0x80000000),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            userData[index]['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Acme',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          color: Colors.blue,
                          onPressed: () {
                            String itemId = '1';
                            Map<String, dynamic> newData = {
                              "name": "Semur Ayammmm",
                            };
                            updateItem(itemId, newData);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
