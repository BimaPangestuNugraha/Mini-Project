import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:resep_koki/Models/ChefProvider.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  String _response = '';
  bool showChefContacts = false;

  Future<void> _submitForm() async {
    String key = '';
    if (_formKey.currentState!.validate()) {
      final apiKey = key;
      const apiUrl = '';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode(<String, dynamic>{
          "model": "text-davinci-003",
          'prompt':
              'Saya punya bahan-bahan berikut: ${_textController.text}. Bisa tolong rekomendasikan masakan yang dapat saya buat?',
          'max_tokens': 500,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          _response = responseData['choices'][0]['text'];
        });
      } else {
        print('Gagal mendapatkan respons. Kode status: ${response.statusCode}');
      }
    } else {
      print('Form tidak valid');
    }
  }

  void _showChefContacts() {
    setState(() {
      showChefContacts = true;
    });
  }

  void _hideChefContacts() {
    setState(() {
      showChefContacts = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF393737),
        title: const Text('Tanyakan pada kami'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF393737),
              ),
              child: Text(
                'Anda bisa menanyakan terkait resep masakan lebih lanjut dengan menghubungi contact di bawah ini',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Acme',
                ),
              ),
            ),
ElevatedButton(
  onPressed: () {
    _showChefContacts();
  },
  child: const Text('Lihat Kontak Chef'),
),
if (showChefContacts)
  Consumer<ChefProvider>(
    builder: (context, chefProvider, child) {
      final chefContacts = chefProvider.chefContacts;
      return ListView.builder(
        itemCount: chefContacts.length,
        itemBuilder: (context, index) {
          final chef = chefContacts[index];
          return ListTile(
            title: Text('Nama: ${chef.name}'),
            subtitle: Text('Telepon: ${chef.phoneNumber}'),
          );
        },
      );
    },
  ),

            if (showChefContacts)
              ElevatedButton(
                onPressed: () {
                  _hideChefContacts();
                },
                child: const Text('Tutup'),
              ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: TextFormField(
                  controller: _textController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Anda belum mengisi pertanyaan.';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Bahan apa saja yang anda punya?',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF393737),
                  ),
                  child: const Text('Kirim', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 500.0,
                height: 515.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFD9D9D9),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Text(_response),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
