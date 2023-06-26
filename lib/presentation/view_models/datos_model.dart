import 'package:flutter/material.dart';

import '../../domain/entities/datos_model.dart';
import '../../domain/entities/uso_casos.dart';

class DatosViewModel extends ChangeNotifier {
  final ObtenerDatosUseCase _obtenerDatosUseCase;

  DatosModel? _datos;

  DatosModel? get datos => _datos;

  DatosViewModel(this._obtenerDatosUseCase);

  Future<void> obtenerDatos() async {
    try {
      _datos = await _obtenerDatosUseCase.obtenerDatos();
      notifyListeners();
    } catch (e) {
      // Manejar el error según tus necesidades
    }
  }
}
