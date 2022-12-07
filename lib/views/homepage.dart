import 'package:flutter/material.dart';

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
        child: Center(
          child: ElevatedButton(
            onPressed: () {

            },
            child: const Text("QR Scanner"),
          ),
        )
      )
    );
  }
}

