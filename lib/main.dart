import 'package:belajar_flutter/42_http_request_get/models/http_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '42_http_request_get/pages/home_provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => HTTPProvider(),
        child: HomePage(),
      ),
    );
  }
}
