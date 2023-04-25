import 'dart:convert';

import 'package:crud_http/domain/models/student.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

class PeticionesStudent {
  static Future<List<Student>> getListStudent() async {
    var url = Uri.parse(
        "https://desarolloweb2021a.000webhostapp.com/APINOTES/listaStudent.php");

    final response = await http.get(url);

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  static List<Student> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    //print(pasar[0]['mensaje']);
    return pasar.map<Student>((json) => Student.desdeJson(json)).toList();
  }
}
