import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {

  final String value;
  final Function screenClosed;

    const DataPage({
      required this.value,
      required this.screenClosed,
      Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Data"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            widget.screenClosed();
            Navigator.pop(context);
          },
        )
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Scanned Code:"),
              const SizedBox(height: 20),
              Text(widget.value)
            ],
          ),
        ),
      )
    );
  }
}
