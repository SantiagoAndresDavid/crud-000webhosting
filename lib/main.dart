import 'package:crud_http/domain/controller/controllerArticles.dart';
import 'package:crud_http/domain/controller/controllerNotes.dart';
import 'package:crud_http/domain/controller/controllerPets.dart';
import 'package:crud_http/domain/controller/controllerStudent.dart';
import 'package:crud_http/domain/controller/controllerUser.dart';
import 'package:crud_http/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ControlUser());
  Get.put(ControlNotes());
  Get.put(ControlArticles());
  Get.put(ControlStudent());
  Get.put(ControlPets());
  runApp(const App());
}
