import 'package:crud_http/domain/controller/controllerPets.dart';
import 'package:crud_http/domain/controller/controllerUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/models/pets.dart';
import '../../auth/modifyPets.dart';

class ListPets extends StatelessWidget {
  const ListPets({super.key});

  @override
  Widget build(BuildContext context) {
    ControlPets controlp = Get.find();
    ControlUser controlu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Mascotas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed("/addPets");
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => controlp
            .getPetsGral(controlu.listaUserLogin![0].id.toString())
            .then((value) {
          Get.offAndToNamed("/listaPets");
        }),
        child: ListView.builder(
          itemCount: controlp.listaPetsFinal!.length  ,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(controlp.listaPetsFinal![index].foto),
              ),
              title: Text(controlp.listaPetsFinal![index].nombre),
              subtitle: Text(controlp.listaPetsFinal![index].raza),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (controlp.listaPetsFinal![index].idUser ==
                      controlu.listaUserLogin![0].id)
                    IconButton(
                      onPressed: () {
                        String id =
                            controlp.listaPetsFinal![index].id.toString();
                        controlp.deletePets(id).then((value) {
                          Get.snackbar('Eliminado con exito',
                              controlp.listaMensajes![0].mensaje,
                              duration: const Duration(seconds: 3),
                              icon: const Icon(Icons.info),
                              shouldIconPulse: true,
                              backgroundColor: Colors.green);
                        });
                        controlp
                            .getPetsGral(
                                controlu.listaUserLogin![0].id.toString())
                            .then((value) {
                          Get.offAndToNamed("/listaPets");
                        });
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  IconButton(
                    onPressed: () {
                      Pets pet = Pets(
                          id: controlp.listaPetsFinal![index].id,
                          foto: controlp.listaPetsFinal![index].foto,
                          nombre: controlp.listaPetsFinal![index].nombre,
                          raza: controlp.listaPetsFinal![index].raza,
                          idUser: controlp.listaPetsFinal![index].idUser);
                      if (pet != null) {
                        Get.to(() => ModifyPets(pet: pet));
                      }
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
