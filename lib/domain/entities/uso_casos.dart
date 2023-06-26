import '../../data/repositories/repositories.dart';
import 'datos_model.dart';

class ObtenerDatosUseCase {
  final DatosRepository _datosRepository;

  ObtenerDatosUseCase(this._datosRepository);

  Future<DatosModel> obtenerDatos() async {
    final datosJson = await _datosRepository.obtenerDatos();
    final datos = DatosModel(
      origen: datosJson['origen'],
      destino: datosJson['destino'],
      distancia: datosJson['distancia_km'],
      tiempo: datosJson['tiempo_minutos'],
      precio: datosJson['precio_total'],
    );
    return datos;
  }
}
