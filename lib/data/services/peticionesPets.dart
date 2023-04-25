import 'dart:convert';

import 'package:crud_http/domain/models/pets.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../domain/models/utiles.dart';

class PeticionesPets {
  static Future<List<Mensajes>> registrarPets(
      String foto, String nombre, String raza, String iduser) async {
    var url = Uri.parse(
        "https://articlesprueba.000webhostapp.com/api/agregarPets.php");

    final response = await http.post(url,
        body: {'foto': foto, 'nombre': nombre, 'raza': raza, 'iduser': iduser});

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista2, response.body);
  }

  static Future<List<Mensajes>> deletPets(String id) async {
    var url = Uri.parse(
        "https://articlesprueba.000webhostapp.com/api/deletePets.php");

    final response = await http.post(url, body: {'id': id});

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista2, response.body);
  }

  static Future<List<Mensajes>> editarPets(
      String id, String foto, String nombre, String raza) async {
    var url =
        Uri.parse("https://articlesprueba.000webhostapp.com/api/updatePet.php");

    final response = await http.post(url, body: {'id': id, 'foto': foto, 'nombre': nombre, 'raza': raza});

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista2, response.body);
  }

  static Future<List<Pets>> getListPets(String iduser) async {
    var url = Uri.parse(
        //"https://desarolloweb2021a.000webhostapp.com/APINOTES/listaPets.php"
        "https://articlesprueba.000webhostapp.com/api/listaPets.php");

    final response = await http.post(url, body: {'iduser':iduser});

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  static List<Mensajes> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['mensaje']);
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static List<Pets> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    //print(pasar[0]['mensaje']);
    return pasar.map<Pets>((json) => Pets.desdeJson(json)).toList();
  }
}
