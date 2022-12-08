import 'package:flutter/material.dart';

import 'package:qr_scanner_itlympics/views/qr_scanner.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("IT Attendance App"),
        ),
        body: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => QRScanner()
                          ));
                    },
                    child: const Text("QR Scanner"),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            )
        )
    );
  }
}

