import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectoapi/controllers/enemigo_controller.dart';
import 'package:proyectoapi/controllers/stats_controller.dart';

class DatosEnemigoPages extends StatelessWidget {
  DatosEnemigoPages({Key? key}) : super(key: key);
  final enemigoController = Get.find<EnemigoController>();
  final statsController = Get.find<StatsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(180),
                      bottomLeft: Radius.circular(180)),
                  color: Colors.blueGrey,
                ),
              )
            ],
          ),
          Positioned(
            top: 30,
            right: 30,
            left: 30,
            child: Image(
              image: NetworkImage("https://api.maplestory.net/monster/" +
                  (enemigoController.enemigo.monsterId!).toString() +
                  "/icon"),
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          
          Positioned(
            top: 140,
            child: Column(
              children: [
                const SizedBox(height: 2),
                Text(
                  "Name: " + (enemigoController.enemigo.name!),
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(height: 2),
                Text(
                  "\u{1F5FF}Level: " +
                      (enemigoController.enemigo.stats!.level).toString(),
                      style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 2),
                Text(
                  "\u{2665}Hp: " +
                      (enemigoController.enemigo.stats!.maxHp).toString(),
                      style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 2),
                Text(
                  "\u{2795}Exp: " +
                      (enemigoController.enemigo.rewards!.exp).toString(),
                      style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 2),
                Text(
                  "\u{2694}Attack: " +
                      (enemigoController.enemigo.stats!.attack).toString(),
                      style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 2),
                Text(
                  "\u{1F52E}Magic Attack: " +
                      (enemigoController.enemigo.stats!.magicAttack).toString(),
                      style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
