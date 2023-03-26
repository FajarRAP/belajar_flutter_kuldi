import 'package:belajar_flutter/41_http_request_post/models/http_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final HTTPProvider dataProvider =
        Provider.of<HTTPProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP Request Post (Provider)"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<HTTPProvider>(
              builder: (context, value, child) => Text(
                (value.data["id"] != null)
                    ? "ID : ${value.data["id"]}"
                    : "ID : Belum Ada",
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer<HTTPProvider>(
              builder: (context, value, child) => Text(
                (value.data["id"] != null)
                    ? "Nama : ${value.data["name"]}"
                    : "Nama : Belum Ada",
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer<HTTPProvider>(
              builder: (context, value, child) => Text(
                (value.data["job"] != null)
                    ? "Kerja : ${value.data["job"]}"
                    : "Kerja : Belum Ada",
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer<HTTPProvider>(builder: (context, value, child) {
              return Text(
                (value.data["createdAt"] != null)
                    ? "Dibuat pada : ${value.data["createdAt"]}"
                    : "Dibuat pada : Belum Ada",
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              );
            }),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  dataProvider.connectAPI("Fajar", "Pencoli");
                },
                child: const Text(
                  "POST DATA",
                  style: TextStyle(fontSize: 36),
                )),
          ],
        ),
      ),
    );
  }
}
