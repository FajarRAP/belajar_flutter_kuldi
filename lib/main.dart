import 'package:belajar_flutter/41_http_request_post/models/http_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '41_http_request_post/pages/home_page_provider.dart';

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
