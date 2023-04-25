
import 'dart:convert';

import 'package:crud_http/domain/models/articles.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PeticionesArticles {
  static Future<List<Articles>> getListArticles() async {
    var url = Uri.parse(
        "https://desarolloweb2021a.000webhostapp.com/APINOTES/listarArticles.php");

    final response = await http
        .get(url);

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  static List<Articles> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    //print(pasar[0]['mensaje']);
    return pasar.map<Articles>((json) => Articles.desdeJson(json)).toList();
  }
}