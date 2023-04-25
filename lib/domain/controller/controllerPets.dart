import 'package:crud_http/data/services/peticionesPets.dart';
import 'package:crud_http/domain/models/pets.dart';
import 'package:get/get.dart';

import '../../data/services/peticionesUser.dart';
import '../models/utiles.dart';

class ControlPets extends GetxController {
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);

  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<Pets>? get listaPetsFinal => listaPets.value;

  final Rxn<List<Pets>> listaPets = Rxn<List<Pets>>([]);

  Future<void> getPetsGral(String iduser) async {
    listaPets.value = await PeticionesPets.getListPets(iduser);
  }

  Future<void> crearPets(
      String foto, String nombre, String raza, String userid) async {
    _listarMensajes.value =
        await PeticionesPets.registrarPets(foto, nombre, raza, userid);
  }

  Future<void> deletePets(String id) async {
    _listarMensajes.value = await PeticionesPets.deletPets(id);
  }

  Future<void> modificarPets(
      String id, String foto, String nombre, String raza) async {
    _listarMensajes.value =
        await PeticionesPets.editarPets(id, foto, nombre, raza);
  }
}
