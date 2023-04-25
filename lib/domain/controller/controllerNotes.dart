import 'package:crud_http/domain/models/notes.dart';
import 'package:get/get.dart';

import '../../data/services/peticionesNotes.dart';

class ControlNotes extends GetxController {
  final Rxn<List<Notes>> listaNotes = Rxn<List<Notes>>([]);

  Future<void> listNotes() async {
    listaNotes.value = await PeticionesNotes.getListNotes();
  }

  List<Notes>? get listaNotesFinal => listaNotes.value;
}
