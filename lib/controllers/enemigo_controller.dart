import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:proyectoapi/api/peticiones_api.dart';
import 'package:proyectoapi/models/enemigo_model.dart';

class EnemigoController extends GetxController {
  @override
  void onInit() {
    obtenerEnemigos();
    super.onInit();
  }

  final peticionesApi = Get.find<PeticionesApi>();

  List<EnemigoModel> enemigos = [];
  List<EnemigoModel> enemigoSearch = [];
  late EnemigoModel enemigo;
  bool cargando = false;

  Future<void> obtenerEnemigos() async {
    update();
    final response = await peticionesApi.httpGet(
        url: "https://api.maplestory.net/monsters/?maxEntries=50000&");
    final listaEnemigos = response.body["result"];
    final listaEnemigosModel = List<EnemigoModel>.from(
      listaEnemigos.map(
        (enemigo) => EnemigoModel.fromJson(enemigo),
      ),
    );
    enemigos.addAll(listaEnemigosModel);
    update();
  }

  Future buscarEnemigos(String query) async {
    final response = await peticionesApi.httpGet(
        url: "https://api.maplestory.net/monsters/?maxEntries=50000&",
        query: {'name': query});

    final listaEnemigos = response.body['result'];
    final listaEnemigosModel = List<EnemigoModel>.from(
      listaEnemigos.map(
        (enemigo) => EnemigoModel.fromJson(enemigo),
      ),
    );
    // enemigoSearch.addAll(listaEnemigosModel);
    enemigoSearch = listaEnemigosModel;
    update();
    
  }
}
