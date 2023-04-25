import 'package:crud_http/ui/auth/login.dart';
import 'package:crud_http/ui/auth/modifyPets.dart';
import 'package:crud_http/ui/auth/register.dart';
import 'package:crud_http/ui/content/articles/listarticles.dart';
import 'package:crud_http/ui/content/notes/add.dart';
import 'package:crud_http/ui/content/notes/list.dart';
import 'package:crud_http/ui/content/pets/listPets.dart';
import 'package:crud_http/ui/content/student/listaStudent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/models/pets.dart';
import 'auth/addPets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crud Usando HTTP',
      theme: ThemeData(primarySwatch: Colors.amber),
      initialRoute: '/login',
      routes: {
        "/login": (context) => const Login(),
        "/register": (context) => const Register(),
        "/addnotes": (context) => const AddNotes(),
        "/listnotes": (context) => const ListNotes(),
        "/listarticles": (context) => const ListArticles(),
        "/listaStudent": (context) => const ListStudent(),
        "/listaPets": (context) => const ListPets(),
        "/addPets": (context) => const AddPets(),
        "/ModifyPets": (context) => const ModifyPets(),
      },
    );
  }
}
