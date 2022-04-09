import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectoapi/controllers/enemigo_controller.dart';

class SearchEnemigo extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_outlined),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Get.find<EnemigoController>().buscarEnemigos(query);
    // TODO: implement buildSuggestions
    return GetBuilder<EnemigoController>(builder: (enemigoController) {
      return (query != '')
          ? ListView.builder(
              itemCount: enemigoController.enemigoSearch.length,
              itemBuilder: (context, i) {
                final enemigo = enemigoController.enemigoSearch[i];
                return ListTile(
                  onTap: () {
                    enemigoController.enemigo = enemigo;
                    Navigator.pushNamed(context, '/detalles/enemigo');
                  },
                  leading: FadeInImage(
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
                              fit: BoxFit.fill);
                        },
                        fit: BoxFit.contain,
                      ),
                  title: Text(enemigo.name!),
                );
              })
          : Stack(
              children: [
                Positioned(
                  child: Center(
                    child: Image(
                      image: NetworkImage("https://i.imgflip.com/6415yq.jpg"),
                      alignment: Alignment.center,
                      width: 400,
                      height: 400,
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  right: 30,
                  top: 100,
                  child: Center(
                    child: Text("No results?",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ), 
                  ),
                ),
              ],
            );
    });
  }
}
// Container(
//               child: Positioned(
//                 child: Center(
//                   child: Image(
//                     image: NetworkImage("https://i.imgflip.com/6415yq.jpg"),
//                     alignment: Alignment.center,
//                     width: 400,
//                     height: 400,
//                   ),
//                 ),
//               ),
//             );
