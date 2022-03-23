import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectoapi/controllers/enemigo_controller.dart';
import 'package:proyectoapi/controllers/stats_controller.dart';
import 'dart:math' as math;

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
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(180),
                      bottomLeft: Radius.circular(180)),
                  // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.primaries[
                            math.Random().nextInt(Colors.primaries.length)],
                        Colors.primaries[
                            math.Random().nextInt(Colors.primaries.length)],
                      ]),
                  // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  // .withOpacity(1.0),
                  // color: Colors.blueGrey,
                ),
              )
            ],
          ),
          Positioned(
            top: 30,
            right: 30,
            left: 30,
            child: FadeInImage(
              image: NetworkImage("https://api.maplestory.net/monster/" +
                  (enemigoController.enemigo.monsterId!).toString() +
                  "/icon"),
              width: 100,
              height: 100,
              placeholder: const NetworkImage(
                  "https://thumbs.gfycat.com/AthleticSnivelingAzurevasesponge.webp"),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.network('https://i.imgur.com/UX2hQaH.png',
                    width: 100, height: 100, fit: BoxFit.contain);
              },
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 140,
            child: Column(
              children: [
                const SizedBox(height: 2),
                Text(
                  (enemigoController.enemigo.name!),
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
                  "\u{2694}Attack: " +
                      (enemigoController.enemigo.stats!.attack).toString(),
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 2),
                Text(
                  "\u{2795}Exp: " +
                      (enemigoController.enemigo.rewards!.exp).toString(),
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Positioned(
            top: 290,
            child: Column(
              children: [
                const SizedBox(height: 2),
                Text(
                  "Extra Info",
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 2),
                Text(
                  "\u{1F52E}Magic Attack: " +
                      (enemigoController.enemigo.stats!.magicAttack).toString(),
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 2),
                Text(
                  "\u{3030}Evasion: " +
                      (enemigoController.enemigo.stats!.evasion).toString(),
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 2),
                Text(
                  "\u{1F3AF}Accuracy: " +
                      (enemigoController.enemigo.stats!.accuracy).toString(),
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 2),
                Text(
                  "\u{23E9}Speed: " +
                      (enemigoController.enemigo.stats!.speed).toString(),
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
