import 'package:crud_http/domain/controller/controllerNotes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListNotes extends StatelessWidget {
  const ListNotes({super.key});

  @override
  Widget build(BuildContext context) {
    ControlNotes controlu = Get.find();
  
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de Apuntes"),
      ),
      body: ListView.builder(
        itemCount: controlu.listaNotesFinal!.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(controlu.listaNotesFinal![index].detalle),
          );
        },
      ),
    );
  }
}
