import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectoapi/controllers/enemigo_controller.dart';

void main() => runApp(const HomePages());

class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('enemigos'),
      ),
      body: GetBuilder<EnemigoController>(builder: (enemigoController) {
        return GridView.builder(
          itemCount: enemigoController.enemigos.length,
          itemBuilder: (context, i) {
            final enemigo = enemigoController.enemigos[i];
            return Card(
              margin: const EdgeInsets.all(15),
              child: InkWell(
                onTap: () {
                  enemigoController.enemigo = enemigo;
                  Navigator.pushNamed(context, '/detalles/enemigo');
                },
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
                        width: 80,
                        height: 80,
                        placeholder: const NetworkImage(
                            "https://thumbs.gfycat.com/AthleticSnivelingAzurevasesponge.webp"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.network(
                              'https://i.imgur.com/UX2hQaH.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.contain);
                        },
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 1),
                      Text(
                        "Name: " + (enemigo.name!),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        "\u{1F5FF}Level: " +
                            (enemigo.stats!.level).toString(),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        "\u{2665}Hp: " + (enemigo.stats!.maxHp).toString(),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        "\u{2795}Exp: " + (enemigo.rewards!.exp).toString(),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        "\u{2694}Attack: " +
                            (enemigo.stats!.attack).toString(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
        );
      }),
    );
  }
}
