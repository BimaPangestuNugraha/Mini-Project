import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  String _response = '';

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
              
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Respon sukses: ${responseData['choices'][0]['text']}');
        setState(() {
          _response = responseData['choices'][0]['text'];
        });
      } else {
        print('Gagal mendapatkan respons. Kode status: ${response.statusCode}');
      }
    } else {
      print('else inside if: ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF393737),
        title: Text('Tanyakan pada kami'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: TextFormField(
                  controller: _textController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Anda belum mengisi pertanyaan.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Bahan apa saja yang anda punya?',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF393737),
                  ),
                  child: Text('Kirim', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 500.0,
                height: 515.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFD9D9D9),
                ),
                padding: EdgeInsets.all(16.0),
                child: Text('$_response'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
