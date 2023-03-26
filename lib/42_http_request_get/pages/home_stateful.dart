import 'dart:math';

import 'package:belajar_flutter/42_http_request_get/models/http_stateful.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HTTPStateful hasil =
      HTTPStateful("Belum Ada", "Belum Ada", "Belum Ada", "Belum Ada");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HTTP Request Get")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(50),
              ),
              child: (hasil.avatar == null)
                  ? const Icon(
                      Icons.person,
                      size: 50,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(hasil.avatar),
                    ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "ID : ${hasil.id}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Nama : ${hasil.name}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Email : ${hasil.email}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  HTTPStateful.connectAPI((1 + Random().nextInt(5)).toString())
                      .then((value) {
                    setState(() {
                      hasil = value;
                    });
                  });
                },
                child: const Text(
                  "GET DATA",
                  style: TextStyle(fontSize: 32),
                )),
          ],
        ),
      ),
    );
  }
}
