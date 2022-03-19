import 'package:flutter/material.dart';
import 'package:proyectoapi/api/peticiones_api.dart';
import 'package:proyectoapi/controllers/enemigo_controller.dart';
import 'package:proyectoapi/controllers/stats_controller.dart';
import 'package:proyectoapi/pages/home_pages.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut(() => PeticionesApi());
  Get.lazyPut(() => EnemigoController());
  Get.lazyPut(() => StatsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Maplestory Enemy List', initialRoute: "/", routes: {
      "/": (context) => HomePages(),
      /*"/detalles/amiibo":(context)=>const DatosAmiiboPages(),*/
    });
  }
}
