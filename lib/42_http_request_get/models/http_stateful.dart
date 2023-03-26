import 'dart:convert';

import 'package:http/http.dart' as http;

class HTTPStateful {
  final String id;
  final String email;
  final String name;
  final String avatar;
  HTTPStateful(this.id, this.email, this.name, this.avatar);
  static Future<HTTPStateful> connectAPI(String id) async {
    final Uri uri = Uri.parse("https://reqres.in/api/users/$id");
    final response = await http.get(uri);
    final Map<String, dynamic> hasil = jsonDecode(response.body)["data"];
    return HTTPStateful(
      hasil["id"].toString(),
      hasil["email"],
      "${hasil["first_name"]} ${hasil["last_name"]}",
      hasil["avatar"],
    );
  }
}
