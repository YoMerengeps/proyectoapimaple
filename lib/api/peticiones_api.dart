//*el await no jala sin el async y tambien se tiene que poner en la funcion que es future xd* */
import 'package:get/get.dart';

class PeticionesApi extends GetConnect {
  Future <Response> httpGet({required String url, Map<String, dynamic> ? query}) async {
    final response = await get(url, query: query);
    return response;
  }
}

//"https://api.maplestory.net/monsters/?maxEntries=50000"