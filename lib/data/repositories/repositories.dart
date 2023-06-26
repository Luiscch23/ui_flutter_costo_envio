import '../providers/api_provider.dart';

class DatosRepository {
  final ApiProvider _apiProvider;

  DatosRepository(this._apiProvider);

  Future<Map<String, dynamic>> obtenerDatos() {
    return _apiProvider.obtenerDatos();
  }
}
