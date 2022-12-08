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
      body: Container(
        height: size.height * 0.8,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/ej.png'),
            fit: BoxFit.fitHeight
          )
        ),
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Na Scan na imong QR Ferson",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    )
                ),
                const SizedBox(height: 20),
                const Text("Scanned Code:",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                )),
                const SizedBox(height: 20),
                Text(widget.value,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ))
              ],
            ),
          ),
        )
    );
  }
}
