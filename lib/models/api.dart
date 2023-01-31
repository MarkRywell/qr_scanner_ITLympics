import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:qr_scanner_itlympics/models/api_response.dart';
import 'package:qr_scanner_itlympics/models/student.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

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

    final pref = await SharedPreferences.getInstance();

    String serverIP = pref.getString("server")!;

    print(serverIP);

    var url = Uri.parse("http://$serverIP:8000/api/student");

    var response = await http.post(url, body: convert.jsonEncode(data),
    headers: {
      "Content-type" : "application/json"
    });

    print(response.body);

    var jsonResponse = await convert.jsonDecode(response.body);

    ApiResponse apiResponse = ApiResponse(
      status: jsonResponse['status'],
      message: jsonResponse['message'],
      data: jsonResponse['data']
    );

    if(response.statusCode != 201) {
      return ([apiResponse, 400]);
    }

    return ([apiResponse, 201]);
  }
}