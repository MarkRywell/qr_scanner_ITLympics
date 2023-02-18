import 'package:flutter/material.dart';
import 'package:qr_scanner_itlympics/views/data_page.dart';
import 'package:qr_scanner_itlympics/views/qr_scanner.dart';
import 'package:qr_scanner_itlympics/views/qr_scanner_server.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool ipValidity = false;
  String? serverIPAddress;
  String? date;
  String? day;

  getServerIP() async {
    final pref = await SharedPreferences.getInstance();

    String? savedDate = pref.getString("date");
    String? savedDay = pref.getString("day");
    String? serverIP = pref.getString("server");

    String currentDate = DateFormat('MMMM d, yyyy').format(DateTime.now());



    setState(() {
      date = savedDate;
      day = savedDay;
    });

    print(currentDate);
    print(savedDate);

    if(pref.getString("server") == null || currentDate != savedDate) {
      return;
    }

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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(day ?? "",
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(date ?? "",
                        style: const TextStyle(
                            fontSize: 24
                        ),),
                    ),
                    SizedBox(height: 50),
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: const [
                            Text("Eyes here, Lycan!",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 14
                            )),
                            SizedBox(height: 50),
                            Text("Were you howling with excitement at Lycan Fest? "
                                "Let us know! We'll be tracking attendance to make "
                                "sure no one misses out. This attendance scanner is "
                                "for the use of LYCAN FEST 2023 only. Be sure to mark "
                                "your attendance here and let's double the fun.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.5,
                                    fontSize: 14
                                )),


                          ],
                        ),
                    ),
                    const SizedBox(height: 50),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: SizedBox(
                        height: 50,
                        width: size.width * 0.4,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[700],
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
                            backgroundColor: Colors.brown[700],
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

