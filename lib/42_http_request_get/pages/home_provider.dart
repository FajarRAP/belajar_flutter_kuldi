import 'dart:math';

import 'package:belajar_flutter/42_http_request_get/models/http_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<HTTPProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP Request Get (Provider)"),
        centerTitle: true,
      ),
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
              child: Consumer<HTTPProvider>(
                builder: (context, value, child) => (value.data["id"] == null)
                    ? const Icon(
                        Icons.person,
                        size: 50,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(value.data["avatar"]),
                      ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer<HTTPProvider>(
              builder: (context, value, child) => (value.data["id"] == null)
                  ? const Text(
                      "ID : Belum Ada",
                      style: TextStyle(fontSize: 24),
                    )
                  : Text(
                      "ID : ${value.data["id"]}",
                      style: const TextStyle(fontSize: 24),
                    ),
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer<HTTPProvider>(
              builder: (context, value, child) => (value.data["id"] == null)
                  ? const Text(
                      "Nama : Belum Ada",
                      style: TextStyle(fontSize: 24),
                    )
                  : Text(
                      "Nama : ${value.data["first_name"]} ${value.data["last_name"]}",
                      style: const TextStyle(fontSize: 24),
                    ),
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer<HTTPProvider>(
              builder: (context, value, child) => (value.data["id"] == null)
                  ? const Text(
                      "Email : Belum Ada",
                      style: TextStyle(fontSize: 24),
                    )
                  : Text(
                      "Email : ${value.data["email"]}",
                      style: const TextStyle(fontSize: 24),
                    ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  data.connectAPI((1 + Random().nextInt(10)).toString());
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
