import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  Future<Map<String, dynamic>> obtenerDatos() async {
    final url = 'http://localhost/api_costo_envio/envio.php';
    print('object');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Error al obtener los datos de la API');
    }
  }
}
