import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/siswa.dart';

class Network {
  final String url = 'http://192.168.0.107/php/latihan/crud';

 Future getData(apiURL) async{
  var fullUrl = url + apiURL;
    http.Response response = await http.get(Uri.parse(fullUrl));
    var data = jsonDecode(response.body);
    print(data.toString());
  }

  // getData(apiURL) async {
  //   var fullUrl = url + apiURL;
  //   var res = await http.get(Uri.parse(fullUrl), headers: _setHeader());
  // }

  _setHeader() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
