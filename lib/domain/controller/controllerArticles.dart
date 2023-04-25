import 'package:crud_http/data/services/peticionesArticles.dart';
import 'package:crud_http/domain/models/articles.dart';
import 'package:get/get.dart';

class ControlArticles extends GetxController {
  final Rxn<List<Articles>> listaArticle = Rxn<List<Articles>>([]);

  Future<void> listArticles() async {
    listaArticle.value = await PeticionesArticles.getListArticles();
  }

  List<Articles>? get listaArticlesFinal => listaArticle.value;
}
