import 'package:crud_http/domain/controller/controllerStudent.dart';
import 'package:crud_http/domain/controller/controllerUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({super.key});

  @override
  Widget build(BuildContext context) {
    ControlStudent controle = Get.find();
    ControlUser controlu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Estudiantes"),
      ),
      body: ListView.builder(
        itemCount: controle.listaStudentGral!.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(controle.listaStudentGral![index].foto),
            ),
            title: Text(
                "${controle.listaStudentGral![index].nombre} ${controle.listaStudentGral![index].apellido}"),
            subtitle: Text(controle.listaStudentGral![index].programa),
            trailing: (controle.listaStudentGral![index].idUser ==
                    controlu.listaUserLogin![0].id)
                ? IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
                : const Text(""),
          );
        },
      ),
    );
  }
}
