import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:qr_scanner_itlympics/models/student.dart';
import 'dart:convert' as convert;


class Api {



  Api.privateConstructor();
  static final Api instance = Api.privateConstructor();


  //Add student to attendance

  Future <dynamic> addStudent(Student student) async {

    Map data = {
      "id" : student.id,
      "name" : student.name,
      "course" : student.course,
      "year" : student.year
    };

    var url = Uri.parse("");

    var response = await http.post(url, body: convert.jsonEncode(data),
    headers: {
      "Content-type" : "application/json"
    });

    return response.statusCode;
  }

}