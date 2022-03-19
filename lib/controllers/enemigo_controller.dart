import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:proyectoapi/api/peticiones_api.dart';
import 'package:proyectoapi/models/enemigo_model.dart';


class EnemigoController extends GetxController{
  @override
  void onInit(){
    obtenerEnemigos();
    super.onInit();
  }

  final peticionesApi = Get.find<PeticionesApi>();

  List <EnemigoModel> enemigos= [];
  late EnemigoModel enemigo;
  bool cargando = false;

  Future <void> obtenerEnemigos() async {
    cargando = true;
    update();
    final response = await peticionesApi.httpGet();
    final listaEnemigos = response.body["result"];
    final listaEnemigosModel = List<EnemigoModel>.from(
      listaEnemigos.map((enemigo)=>EnemigoModel.fromJson(enemigo)));
    enemigos.addAll(listaEnemigosModel);
    update();
  }

}
