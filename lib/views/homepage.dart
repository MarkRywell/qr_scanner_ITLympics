import 'package:flutter/material.dart';
import 'package:qr_scanner_itlympics/views/data_page.dart';

import 'package:qr_scanner_itlympics/views/qr_scanner.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.4,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                    ),
                    child: Center(
                      child: Text("Intro Text Here"),
                    ),
                  ),
                  SizedBox(height: 100),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 50,
                      width: size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => const QRScanner()
                              ));
                        },
                        child: const Text("QR Scanner",
                        style: TextStyle(
                          fontSize: 16,
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            )
        )
    );
  }
}

