import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HTTPProvider extends ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  Future<void> connectAPI(String id) async {
    String url = "https://reqres.in/api/users/$id";
    Uri uri = Uri.parse(url);
    final http.Response response = await http.get(uri);
    _data = jsonDecode(response.body)["data"];
    notifyListeners();
  }
}
