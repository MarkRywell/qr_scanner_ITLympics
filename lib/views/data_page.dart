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

    Size size = MediaQuery.of(context).size;

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
          child: Column(
            children: [

            ],
          ),
        )
    );
  }
}
