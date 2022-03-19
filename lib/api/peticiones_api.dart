//*el await no jala sin el async y tambien se tiene que poner en la funcion que es future xd* */
import 'package:get/get.dart';

class PeticionesApi extends GetConnect {
  Future <Response> httpGet() async {
    final response = await get("https://api.maplestory.net/monsters/");
    return response;
  }
}
