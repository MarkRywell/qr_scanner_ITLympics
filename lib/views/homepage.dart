import 'package:flutter/material.dart';
import 'package:qr_scanner_itlympics/views/data_page.dart';

import 'package:qr_scanner_itlympics/views/qr_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool ipValidity = false;
  String? serverIPAddress;

  var formKey = GlobalKey<FormState>();

  late TextEditingController hostController = TextEditingController(text: serverIPAddress);

  setServerIP(String IP) async {
    final pref = await SharedPreferences.getInstance();

    pref.setString("server", IP);

    setState(() {
      ipValidity = true;
    });

    print(pref.getString("server"));
  }

  getServerIP() async {
    final pref = await SharedPreferences.getInstance();

    String? serverIP = pref.getString("server");


    setState(() {
      serverIPAddress = serverIP;
    });
    print(serverIPAddress);
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
                    const SizedBox(height: 100),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      child: Form(
                        key: formKey,
                        child: TextFormField(
                          controller: hostController,
                          decoration: InputDecoration(
                            labelText: "Server IP Address",
                            hintText: "E.g. 192.168.1.5",
                            contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 5),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            suffix: IconButton(
                              onPressed: () {
                                if(formKey.currentState!.validate()) {
                                  setServerIP(hostController.text);
                                }
                              },
                              icon: const Icon(Icons.check,
                              ),
                            ),
                          ),
                          validator: (value) {
                            return value == null || value.isEmpty ? "Enter Server Address" : null;
                          },
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
                          onPressed: ipValidity ? () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => const QRScanner()
                                ));
                          } : null,
                          child: const Text("QR Scanner",
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

