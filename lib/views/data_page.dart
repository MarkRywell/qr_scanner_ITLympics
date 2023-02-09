import 'package:flutter/material.dart';
import 'package:qr_scanner_itlympics/custom_widgets/custom_text.dart';
import 'package:qr_scanner_itlympics/models/api.dart';
import 'package:qr_scanner_itlympics/models/student.dart';

class DataPage extends StatefulWidget {

  final Student student;
  final Function screenClosed;

  const DataPage({
    required this.student,
    required this.screenClosed,
    Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {


  showStatus({required Color color, required String text}) {    // Snackbar to show message of API Response
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(text),
            backgroundColor: color,
            padding: const EdgeInsets.all(15),
            behavior: SnackBarBehavior.fixed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigo[900],
            title: const Text("Student Data"),
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text("QR Code Data",
                  style: TextStyle(
                      fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                  constraints: BoxConstraints(
                    minHeight: size.height * 0.2,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2)
                  ),
                  child: Column(
                    children: [
                      CustomText(textTitle: "Student ID: ", textData: widget.student.student_id.toString()),
                      CustomText(textTitle: "Student Name: ", textData: widget.student.name),
                      CustomText(textTitle: "Course: ", textData: widget.student.course),
                      CustomText(textTitle: "Year: ", textData: widget.student.year.toString())
                    ],
                  ),
              ),
              const SizedBox(height: 100),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 40,
                  width: size.width * 0.6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[900],
                    ),
                    onPressed: () async {

                     var response = await Api.instance.addStudent(widget.student);

                     if(response[1] == 201) {
                       showStatus(color: Colors.greenAccent, text: response[0].message);
                       Navigator.pop(context);
                     }
                     else {
                       showStatus(color: Colors.redAccent, text: response[0].message);
                     }

                    },
                    child: const Text("ADD STUDENT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
