import 'package:flutter/material.dart';
import 'package:belajar_flutter/41_http_request_post/models/http_stateful.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HTTPStateful data = HTTPStateful(
      id: "Belum Ada",
      name: "Belum Ada",
      job: "Belum Ada",
      createdAt: "Belum Ada");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP Request Post (Stateful)"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ID : ${data.id}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Nama : ${data.name}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Job : ${data.job}",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Dibuat pada : ${data.createdAt}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {
                HTTPStateful.connectAPI("Empud", "Pengangguran").then((value) {
                  setState(() {
                    data = value;
                  });
                });
              },
              child: const Text(
                "POST DATA",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
