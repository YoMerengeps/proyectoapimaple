import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectoapi/controllers/enemigo_controller.dart';

class DatosEnemigoPages extends StatelessWidget{
  DatosEnemigoPages ({Key? key}) : super(key:key);
  final enemigoController = Get.find<EnemigoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
          Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(180),bottomLeft: Radius.circular(180)),
            color: Colors.blueGrey,
            ),
          )
        ],
        ),
      ],
    ),
    );
  }
}