import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectoapi/controllers/enemigo_controller.dart';
import 'package:proyectoapi/models/enemigo_model.dart';

void main() => runApp(HomePages());

class HomePages extends StatelessWidget {
  HomePages({Key? key}) : super(key: key);
  final enemigocontroller = Get.find<EnemigoController>();

  @override
  Widget build(BuildContext context) {
    Get.put(EnemigoController());
    Get.put(Stats());
    return Scaffold(
      appBar: AppBar(
        title: const Text('enemigos'),
      ),
      body: GetBuilder<EnemigoController>(builder: (Stats) {
        return GridView.builder(
          itemCount: Stats.enemigos.length,
          itemBuilder: (context, i) {
            final enemigo = Stats.enemigos[i];
            return Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.cyan,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FadeInImage(
                        image: NetworkImage(
                            "https://api.maplestory.net/monster/" +
                                (enemigo.monsterId!).toString() +
                                "/icon"),
                        width: 100,
                        height: 100,
                        placeholder:
                            NetworkImage("https://thumbs.gfycat.com/AthleticSnivelingAzurevasesponge.webp"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.network(
                              'https://i.imgur.com/UX2hQaH.png',
                              width: 140,
                              height: 140,
                              fit: BoxFit.contain);
                        },
                        fit: BoxFit.contain,
                      ),
                      // Image(
                      //   image: NetworkImage(
                      //       "https://api.maplestory.net/monster/" +
                      //           (enemigo.monsterId!).toString() +
                      //           "/icon"),
                      //   width: 70,
                      //   height: 70,
                      // ),
                      SizedBox(height: 2),
                      Text(
                        "Name: " + (enemigo.name!),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "\u{1F5FF}Level: " + (enemigo.stats!.level).toString() ,
                      ),
                      SizedBox(height: 2),
                      
                      Text(
                        "\u{2665}Hp: " + (enemigo.stats!.maxHp).toString(),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "\u{2795}Exp: " + (enemigo.rewards!.exp).toString(),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "\u{2694}Attack: " + (enemigo.stats!.attack).toString(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        );
      }),
    );
  }
}
