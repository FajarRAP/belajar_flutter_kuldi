import 'dart:convert';

import 'package:http/http.dart' as http;

class HTTPStateful {
  final String id;
  final String name;
  final String job;
  final String createdAt;

  HTTPStateful({
    required this.id,
    required this.name,
    required this.job,
    required this.createdAt,
  });

  static Future<HTTPStateful> connectAPI(String name, String job) async {
    String url = "https://reqres.in/api/users";
    Uri uri = Uri.parse(url);
    final response = await http.post(uri, body: {"name": name, "job": job});
    final hasil = jsonDecode(response.body);
    return HTTPStateful(
        id: hasil["id"],
        name: hasil["name"],
        job: hasil["job"],
        createdAt: hasil["createdAt"]);
  }
}
