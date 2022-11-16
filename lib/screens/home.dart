import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/siswa.dart';
import '../network/api.dart';
import 'add.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Siswa> siswa = [];
  

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<List<Siswa>> getData() async {
    var url = 'http://192.168.0.107/php/latihan/crud/viewData.php';
    final response = await http.get(
      Uri.parse(url),

      // headers: {
      //   "Access-Control-Allow-Origin": "*",
      //   'Content-Type': 'application/json',
      //   'Accept': '*/*'
      // }
    );
    var list = await json.decode(response.body).cast<Map<String, dynamic>>();
    setState(() {
      
    });
    return await list.map<Siswa>((json) => Siswa.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: FutureBuilder<List<Siswa>>(
          future: getData(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Container(
                      child: Text('Jumlah siswa ${siswa.length}'),
                      
                    ),
                    DataTable(
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text(
                            'NIS',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Nama',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Kelas',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Alamat',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                      rows: snapShot.data!.map<DataRow>((e) {
                        return DataRow(
                          cells: [
                            DataCell(Text('${e.nis}')),
                            DataCell(Text('${e.nama}')),
                            DataCell(Text('${e.kelas}')),
                            DataCell(Text('${e.alamat}')),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )),
      ),
    );
  }
}
