import 'package:crud_http/data/services/peticionesStudent.dart';
import 'package:crud_http/domain/models/student.dart';
import 'package:get/get.dart';

class ControlStudent extends GetxController {
  final Rxn<List<Student>> listaStudent = Rxn<List<Student>>([]);

  Future<void> getStudentGral() async {
    listaStudent.value = await PeticionesStudent.getListStudent();
  }

  List<Student>? get listaStudentGral => listaStudent.value;
}
