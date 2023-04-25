import 'dart:convert';

import 'package:crud_http/domain/models/notes.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class PeticionesNotes {
  static Future<List<Notes>> getListNotes() async {
    var url = Uri.parse(
        "https://desarolloweb2021a.000webhostapp.com/APINOTES/listarNotes.php");

    final response = await http
        .get(url);

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  static List<Notes> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    //print(pasar[0]['mensaje']);
    return pasar.map<Notes>((json) => Notes.desdeJson(json)).toList();
  }
}