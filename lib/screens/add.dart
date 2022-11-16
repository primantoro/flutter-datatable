import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController nama = new TextEditingController();
  TextEditingController kelas = new TextEditingController();
  TextEditingController alamat = new TextEditingController();

  Future sendData() async {
    var url = 'http://192.168.0.107/php/latihan/crud/proses.php';
    final response = await http.post(
      Uri.parse(url), body: {
    "name": nama.text,
    "email": kelas.text,
    "mobile":alamat.text,
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Form Tambah Data Siswa'),
          backgroundColor: Colors.green,
          leading: BackButton(
            color: Colors.black,
          )),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                child: TextFormField(
                  controller: nama,
                  decoration: InputDecoration(
                    hintText: 'Masukan Nama',
                    label: Text('Nama *'),
                  ),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: kelas,
                  decoration: InputDecoration(
                    hintText: 'Masukan Kelas',
                    label: Text('Kelas *'),
                  ),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: alamat,
                  decoration: InputDecoration(
                    hintText: 'Masukan Alamat',
                    label: Text('Alamat *'),
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(onPressed: () {
                  sendData();
                }, child: Text('Send')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
