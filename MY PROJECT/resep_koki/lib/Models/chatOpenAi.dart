import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form dan Tombol Submit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  String _response = '';

  Future<void> _submitForm() async {
    String key = AppConfig().openaiApiKey;
    if (_formKey.currentState!.validate()) {
      final apiKey = key; // Ganti dengan kunci API OpenAI Anda
      const apiUrl =
          'https://api.openai.com/v1/completions'; // Ganti dengan URL endpoint yang sesuai
      // const apiUrl =
      //     'https://api.openai.com/v1/chat/completions'; // Ganti dengan URL endpoint yang sesuai

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8',
          'Authorization': 'Bearer $apiKey'
        },
        body: jsonEncode(<String, dynamic>{
          // "model": "gpt-3.5-turbo",
          "model": "text-davinci-003",
          'prompt':
              "jika ada yang bertanya kamu siapa, silahkan di jawab saya adalah kecerdasan buatan dari open AI dengan model davinci 003" +
                  _textController.text,
          'max_tokens': 50, // Jumlah token maksimum dalam respons
        }),
      );

      if (response.statusCode == 200) {
        // Berhasil mendapatkan respons dari server
        final responseData = jsonDecode(response.body);
        print('Respon sukses: ${responseData['choices'][0]['text']}');
        setState(() {
          _response = responseData['choices'][0]['text'];
        });
      } else {
        // Gagal mendapatkan respons dari server
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
        title: Text('Form dan Tombol Submit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _textController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field harus diisi';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Input Text'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
              const SizedBox(height: 20),
              Text('Response: $_response'),
            ],
          ),
        ),
      ),
    );
  }
}