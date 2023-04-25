class Notes {
  late int id;
  late String detalle;
  late int idUser;

  Notes({required this.id, required this.detalle, required this.idUser});

  factory Notes.desdeJson(Map<String, dynamic> jsonMap) {
    return Notes(
        id: int.parse(jsonMap['id']),
        detalle: jsonMap['detalle'],
        idUser: int.parse(jsonMap['idUser']));
  }
}
