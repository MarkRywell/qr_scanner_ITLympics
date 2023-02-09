import 'package:flutter/material.dart';
import 'package:qr_scanner_itlympics/views/data_page.dart';

import 'package:qr_scanner_itlympics/views/qr_scanner.dart';
import 'package:qr_scanner_itlympics/views/qr_scanner_server.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool ipValidity = false;
  String? serverIPAddress;

    //
    // setServerIP(String IP) async {
    //   final pref = await SharedPreferences.getInstance();
    //
    //   pref.setString("server", IP);
    //
    //   setState(() {
    //     ipValidity = true;
    //   });
    //
    //   print(pref.getString("server"));
    // }
  getServerIP() async {
    final pref = await SharedPreferences.getInstance();

    if(pref.getString("server") == null) {
      return;
    }

    String? serverIP = pref.getString("server");
    setState(() {
      serverIPAddress = serverIP;
      ipValidity = true;
    });
  }

  @override
  void initState() {
    getServerIP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text("This Attendance Scanner is for ITLYMPICS "
                            "purposes only. This is to track all the students "
                            "who attended the said activity and more.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 16
                        )),
                    ),
                    const SizedBox(height: 50),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: SizedBox(
                        height: 50,
                        width: size.width * 0.4,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo[900],
                          ),
                          onPressed: () async {
                            await Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => const QrScannerServer()
                                ));
                            getServerIP();
                          },
                          child: const Text("Scan Event",
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: SizedBox(
                        height: 50,
                        width: size.width * 0.4,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo[900],
                          ),
                          onPressed: ipValidity ? () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => const QRScanner()
                                ));
                          } : null,
                          child: const Text("Scan Student",
                            style: TextStyle(
                              fontSize: 16,
                            ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}

