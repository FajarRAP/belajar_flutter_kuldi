import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HTTPProvider extends ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;
  int get nData => _data.length;

  Future<void> connectAPI(String name, String job) async {
    String url = "https://reqres.in/api/users";
    Uri uri = Uri.parse(url);
    final response = await http.post(uri, body: {"name": name, "job": job});
    _data = jsonDecode(response.body);
    notifyListeners();
  }
}
