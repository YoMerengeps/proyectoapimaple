import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:proyectoapi/api/peticiones_api.dart';
import 'package:proyectoapi/models/enemigo_model.dart';

class StatsController extends GetxController {
  @override
  void onInit() {
    obtenerStats();
    super.onInit();
  }

  final peticionesApi = Get.find<PeticionesApi>();
  List<Stats> stats = [];
  late Stats stat;

  bool cargando = false;

  Future<void> obtenerStats() async {
    cargando = true;
    update();
    final response = await peticionesApi.httpGet();
    final listaStats = response.body["result"];
    final listaStatsModel =List<Stats>.from(
      listaStats.map((stat) => Stats.fromJson(stat)));
    stats.addAll(listaStatsModel);
    update();
  }
}
